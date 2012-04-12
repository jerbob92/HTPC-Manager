import htpc
from github import github
import urllib2
import zipfile, tarfile
import shutil
from glob import glob
import cherrypy
import os

from htpc.settings import *

Owner = "mhendrikx"
Repo = "HTPC-Manager"
Branch = "development"
GitHubURL = "https://github.com/%s/%s/tarball/%s" % (Owner, Repo, Branch)

def GetHashFromFile():
    
    config = readSettings();
    LocalHash = config.get('version')
    return LocalHash

def WriteHashToFile(RemoteHash):
	
    LocalHash = { 'version': RemoteHash };
    saveSettings(LocalHash)
        
def GetHashFromGitHub():
    
    gh = github.GitHub()
    
    for c in reversed(gh.commits.forBranch(Owner, Repo, Branch)):
        short = (c.id[:7])
        long = (c.id)
        
    shorthash = short.splitlines()[0]
    longhash = long.splitlines()[0]
    
    return (shorthash, longhash)
    		
def DownloadNewVersion():
  
    # Download repo
    url = urllib2.urlopen(GitHubURL)
    f = open(os.path.join(htpc.root,'%s.tar.gz' % Repo), 'wb')
    f.write(url.read())
    f.close()
    
    # Write new hash to file
    WriteHashToFile(GetHashFromGitHub()[1])
    
    # Extract to temp folder
    tar = tarfile.open(os.path.join(htpc.root, '%s.tar.gz' % Repo))
    tar.extractall(os.path.join(htpc.root, '%s-update' % Repo))
    tar.close()

    # Delete .tar.gz
    os.remove(os.path.join(htpc.root, '%s.tar.gz' % Repo))

    # Overwrite old files with new ones
    root_src_dir = os.path.join(htpc.root, "%s-update/%s-%s-%s" % (Repo, Owner, Repo, GetHashFromGitHub()[0]))
    root_dst_dir = htpc.root
    
    for src_dir, dirs, files in os.walk(root_src_dir):
        dst_dir = src_dir.replace(root_src_dir, root_dst_dir)
        if not os.path.exists(dst_dir):
            os.mkdir(dst_dir)
        for file_ in files:
            src_file = os.path.join(src_dir, file_)
            dst_file = os.path.join(dst_dir, file_)
            if os.path.exists(dst_file):
                os.remove(dst_file)
            shutil.move(src_file, dst_dir)
    
    try:
        shutil.rmtree(os.path.join(htpc.root, "%s-update" % Repo))
    except Exception:
        pass
            
def CheckForUpdates():

    gh = github.GitHub()
    
    L = list((c.id) for c in gh.commits.forBranch(Owner, Repo, Branch))

    try:
		i = L.index(GetHashFromFile())
    except ValueError:
		i = -1 # no match, file empty

    if i == -1:
        #DownloadNewVersion() # First time use tell them to update and if they agree call DownloadNewVersion()
        data = { 'updateavailable': 'yes' };
        saveSettings(data)
        return True
    elif i == 0:
        #raise cherrypy.HTTPRedirect("/") # no update available dont show anything
        data = { 'updateavailable': 'no' };
        saveSettings(data)
        return True
    else:
        #DownloadNewVersion() # Update Available and if they agree call DownloadNewVersion()
        data = { 'updateavailable': 'yes' };
        saveSettings(data)
        return True