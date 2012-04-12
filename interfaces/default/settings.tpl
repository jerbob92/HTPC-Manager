#if $os.path.isfile($webdir):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if

<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>Settings</h1>
        </div>

        #if $getVar('noresizer_found', 0) == 1
        <div class="alert alert-block"><strong>Warning: </strong>Failed to resize thumbnails. This can be slow on some browsers. For more information and a solution on how to fix this visit <a href="http://htpcmanager.org/#faq" target="_blank">http://htpcmanager.org/#faq</a></div>
        #end if

        <ul class="nav nav-tabs">
            <li class="dropdown active">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Server 
					<b class="caret"></b>
				</a>
			<ul class="dropdown-menu">
				<li><a href="#server" data-toggle="tab">HTPC Manager</a></li>
				<li><a href="#xbmc" data-toggle="tab">XBMC</a></li>
				<li><a href="#sabnzbd" data-toggle="tab">SABNzbd</a></li>
				<li><a href="#sickbeard" data-toggle="tab">SickBeard</a></li>
				<li><a href="#couchpotato" data-toggle="tab">CouchPotato v2</a></li>
				<li><a href="#headphones" data-toggle="tab">Headphones</a></li>
				<li><a href="#trakt" data-toggle="tab">Trakt</a></li>
			</ul>
			</li>
            <li><a href="#miscellaneous" data-toggle="tab">Display</a></li>
            <li><a href="#search" data-toggle="tab">NZB Search</a></li>
            <li><a href="#filemanager" data-toggle="tab">File Manager</a></li>
        </ul>
        <form action="" id="base-settings-form" name="base-settings-form" method="post" class="form-horizontal">
            <input type="hidden" name="save_settings" value="1" />
            <div class="tab-content">
					<div id="server" class="tab-pane active">
			            <fieldset>
                            <legend>HTPC Manager</legend>
                            <div class="control-group">
                                <label class="control-label" for="my_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="my_port" name="my_port" type="text" value="$getVar('my_port', '8084')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="my_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="my_username" name="my_username" type="text" value="$getVar('my_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="my_password">Password</label>
                                <div class="controls">
                                    <input class="span3" autocomplete="off" id="my_password" name="my_password" type="password" value="$getVar('my_password', '')" />
                                </div>
                            </div>
                        </fieldset>
						<div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="theme">Theme</label>
                            <div class="controls">
                                <select id="theme" name="theme">
                                    #for $interface in $availinterfaces
                                        #if $getVar('theme', 'default') == $interface
                                            <option selected="selected" value="$interface">$interface</option>
                                        #else
                                            <option value="$interface">$interface</option>
                                        #end if
                                    #end for
                                </select>
                            </div>
                        </div>
					</div>
					
					<div id="sabnzbd" class="tab-pane fade">
					                        <fieldset>
                            <legend>SABnzbd</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_nzb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_nzb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_nzb" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: Info</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_nzb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_nzb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_nzb" />
                                        #end if
                                    </label>
                                </div>
                            </div>                            
                            <div class="control-group">
                                <label class="control-label" for="nzb_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_name" name="nzb_name" type="text" placeholder="This field is required" value="$getVar('nzb_name', 'SABnzbd')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_ip" name="nzb_ip" type="text" placeholder="ex: localhost" value="$getVar('nzb_ip', '127.0.0.1')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_username" name="nzb_username" type="text" value="$getVar('nzb_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_password" name="nzb_password" type="password" value="$getVar('nzb_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="nzb_port" name="nzb_port" type="text" value="$getVar('nzb_port', '8080')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_apikey" name="nzb_apikey" type="text" value="$getVar('nzb_apikey', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">SSL</label>
                                <div class="controls">
                                    <label class="radio">
                                        #if $getVar('nzb_ssl', 'no') == "no"
                                        <input type="radio" checked="checked" value="no" name="nzb_ssl" /> No
                                        #else
                                        <input type="radio" checked="" value="no" name="nzb_ssl" /> No
                                        #end if
                                    </label>
                                    <label class="radio">
                                        #if $getVar('nzb_ssl', 'no') == "yes"
                                        <input type="radio" checked="checked" value="yes" name="nzb_ssl" /> Yes
                                        #else
                                        <input type="radio" value="yes" name="nzb_ssl" /> Yes
                                        #end if
                                    </label>
                                </div>
                            </div>
                        </fieldset>
						<div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
					</div>
					
					<div id="sickbeard" class="tab-pane fade">
				                        <fieldset>
                            <legend>SickBeard</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_sb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_sb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_sb" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: Next Aired</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_sb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_sb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_sb" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="sb_name" name="sb_name" type="text" value="$getVar('sb_name', 'SickBeard')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="sb_ip" name="sb_ip" type="text" value="$getVar('sb_ip', '127.0.0.1')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="sb_username" name="sb_username" type="text" value="$getVar('sb_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="sb_password" name="sb_password" type="password" value="$getVar('sb_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="sb_port" name="sb_port" type="text" value="$getVar('sb_port', '8081')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span3" id="sb_apikey" name="sb_apikey" type="text" value="$getVar('sb_apikey', '')" />
                                </div>
                            </div>
                        </fieldset>
						<div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
					</div>
					
					<div id="couchpotato" class="tab-pane fade">
				                        <fieldset>
                            <legend>CouchPotato V2</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_cp', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_cp" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_cp" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: Movies</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_cp', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_cp" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_cp" />
                                        #end if
                                    </label>
                                </div>
                            </div>                            
                            <div class="control-group">
                                <label class="control-label" for="cp_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="cp_name" name="cp_name" type="text" value="$getVar('cp_name', 'CouchPotato')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="cp_ip" name="cp_ip" type="text" value="$getVar('cp_ip', '127.0.0.1')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="cp_username" name="cp_username" type="text" value="$getVar('cp_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="cp_password" name="cp_password" type="password" value="$getVar('cp_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="cp_port" name="cp_port" type="text" value="$getVar('cp_port', '5050')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span3" id="cp_apikey" name="cp_apikey" type="text" value="$getVar('cp_apikey', '')" />
                                </div>
                            </div>
                        </fieldset>
						<div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>

					</div>
					
					<div id="xbmc" class="tab-pane fade">
                        <fieldset>
                            <legend>XBMC</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_xbmc', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_xbmc" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_xbmc" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: Movies</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_rec_movies', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_rec_movies" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_rec_movies" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: TV</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_rec_tv', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_rec_tv" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_rec_tv" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Dashboard: Music</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('use_dash_rec_music', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_dash_rec_music" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_dash_rec_music" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_name" name="xbmc_name" type="text" value="$getVar('xbmc_name', 'XBMC')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_ip" name="xbmc_ip" type="text" value="$getVar('xbmc_ip', '127.0.0.1')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_username" name="xbmc_username" type="text" value="$getVar('xbmc_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_password" name="xbmc_password" type="password" value="$getVar('xbmc_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="xbmc_port" name="xbmc_port" type="text" value="$getVar('xbmc_port', '80')" />
                                </div>
                            </div>
                        </fieldset>
						<div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
					</div>
					<div id="headphones" class="tab-pane fade">
                    <legend>Headphones</legend>
					Coming Soon!!!
					</div>
					<div id="trakt" class="tab-pane fade">
                    <legend>Trakt</legend>
					Coming Soon!!!
					</div>
					
					<div id="miscellaneous" class="tab-pane" >
                        <fieldset>
                            <legend>Thumbnails</legend>
                            <div class="control-group">
                                <label class="control-label" for="regenerate_thumbs">Regenerate thumbnails</label>
                                <div class="controls">
                                    <input type="checkbox" value="yes" name="regenerate_thumbs" id="regenerate_thumbs" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Banners for TV Shows</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('xbmc_show_banners', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="xbmc_show_banners" />
                                        #else
                                        <input type="checkbox" value="yes" name="xbmc_show_banners" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Options</legend>
                            <div class="control-group">
                                <label class="control-label">Sorting ignore articles (When possible)</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('sort_ignore_articles', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="sort_ignore_articles" />
                                        #else
                                        <input type="checkbox" value="yes" name="sort_ignore_articles" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_scroll_limit">XBMC scroll limit</label>
                                <div class="controls">
                                    <input class="span1" id="xbmc_scroll_limit" name="xbmc_scroll_limit" type="text" value="$getVar('xbmc_scroll_limit', '0')" />
                                    <span class="help-inline">To show all enter '0'</span>
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
					</div>

					<div id="search" class="tab-pane" >
						<fieldset>
							<legend>NZB Matrix</legend>
							<div class="control-group">
								<label class="control-label">Enable</label>
								<div class="controls">
									<label class="checkbox enable-module">
                                    #if $getVar('use_nzbmatrix', 'no') == "yes"
                                    <input type="checkbox" checked="checked" value="yes" name="use_nzbmatrix" />
                                    #else
                                    <input type="checkbox" value="yes" name="use_nzbmatrix" />
                                    #end if
                                </label>
                            </div>
                        </div>
                        <div class="control-group">
                                <label class="control-label" for="nzbmatrix_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="nzbmatrix_name" name="nzbmatrix_name" type="text" value="$getVar('nzbmatrix_name', 'NZB Search')" />
                                </div>
                            </div>
                        <div class="control-group">
                            <label class="control-label" for="nzbmatrix_apikey">API Key</label>
                            <div class="controls">
                                <input class="span3" id="nzbmatrix_apikey" name="nzbmatrix_apikey" type="text" value="$getVar('nzbmatrix_apikey', '')" />
                            </div>
                        </div>
                    </fieldset>

                    <div class="form-actions">
                        <input class="btn btn-primary" type="submit" value="Save changes" />
                        <input class="btn" type="reset" value="Clear" />
                    </div>
                </div>
				
                <div id="filemanager" class="tab-pane" >
                    <fieldset>
                        <legend>Enabled paths</legend>
                        <div class="control-group">
                            <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_filemanger', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_filemanger" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_filemanger" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                        <div class="control-group">
                            <label class="control-label" for="filemanager">Menu Name</label>
                            <div class="controls">
                                <input class="span3" id="filemanager" name="filemanager" type="text" value="$getVar('filemanager', 'File Manager')" />
                            </div>
                        </div>
                        #for $path in $availpaths
                        <div class="control-group">
                            <label class="control-label">$path</label>
                            <div class="controls">
                                <label class="checkbox">
                                    #if $getVar('paths__' + $path.lower(), 'no') == "yes"
                                    <input type="checkbox" checked="checked" value="yes" name="paths__$path" />
                                    #else
                                    <input type="checkbox" value="yes" name="paths__$path" />
                                    #end if
                                </label>
                            </div>
                        </div>
                        #end for
                    </fieldset>

                    <div class="form-actions">
                        <input class="btn btn-primary" type="submit" value="Save changes" />
                        <input class="btn" type="reset" value="Clear" />
                    </div>

                </div>

            </div>

        </form>
    </div>

</div>

#if $os.path.isfile($webdir):
#include $webdir + "./footer.tpl"#
#else
#include $defaultwebdir + "./footer.tpl"#
#end if
