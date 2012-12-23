import cherrypy
import htpc

cherrypy.config.update({
    'server.environment': 'production',
    'server.socket_host': htpc.host,
    'server.socket_port': htpc.port,
    'server.root' : htpc.root
})

rootConfig = {
    'tools.staticdir.root': htpc.root,
    'tools.encode.on': True,
    'tools.encode.encoding': 'utf-8',
    'tools.staticdir.dir' : '/',
    'tools.staticfile.root' : htpc.root
}

authDict = {}
config = htpc.settings.readSettings()
if config.has_key('my_username') and config.get('my_username') != '' and config.has_key('my_password') and config.get('my_password') != '':
    userpassdict = {config.get('my_username') : config.get('my_password')}
    get_ha1 = cherrypy.lib.auth_digest.get_ha1_dict_plain(userpassdict)
    authDict = {
        'tools.auth_digest.on': True,
        'tools.auth_digest.realm': 'htpc',
        'tools.auth_digest.get_ha1': get_ha1,
        'tools.auth_digest.key': 'a565c27146791cfb'
    }

rootConfig.update(authDict)

interfacefolder = 'default'
if config.has_key('theme') and config.get('theme') != '':
    interfacefolder = config.get('theme')

appConfig = {
    '/':  rootConfig,
    '/favicon.ico' : {
        'tools.staticfile.on' : True,
        'tools.staticfile.filename' : "interfaces/" + htpc.defaultinterface + "/static/favicon.ico"
    },
    '/css': {
        'tools.staticdir.on' : True,
        'tools.staticdir.dir' : "interfaces/" + htpc.defaultinterface + "/static/css"
    },
    '/js': {
        'tools.staticdir.on' : True,
        'tools.staticdir.dir' : "interfaces/" + htpc.defaultinterface + "/static/js"
    },
    '/img': {
        'tools.staticdir.on' : True,
        'tools.staticdir.dir' : "interfaces/" + htpc.defaultinterface + "/static/img"
    }
}

import os
interfaceDefault = os.path.join(htpc.interfaces, htpc.defaultinterface)
interfaceDefaultStatic = os.path.join(interfaceDefault, 'static/')
interfaceTheme = os.path.join(htpc.interfaces, htpc.interfacefolder)
interfaceThemeStatic = os.path.join(interfaceTheme, 'static/')

if htpc.interfacefolder != htpc.defaultinterface:
    cssFiles = os.listdir(os.path.join(interfaceDefaultStatic, 'css/'))
    for file in cssFiles:
        updatePath = os.path.join(interfaceThemeStatic, 'css/');
        updateFile = os.path.join(updatePath, file)
        if os.path.isfile(updateFile):
            appConfig['/css/' + file] = {
                'tools.staticfile.on' : True,
                'tools.staticfile.filename' : "interfaces/" + htpc.interfacefolder + "/static/css/" + file
            }

    imgFiles = os.listdir(os.path.join(interfaceDefaultStatic, 'img/'))
    for file in imgFiles:
        updatePath = os.path.join(interfaceThemeStatic, 'img/');
        updateFile = os.path.join(updatePath, file)
        if os.path.isfile(updateFile):
            appConfig['/img/' + file] = {
                'tools.staticfile.on' : True,
                'tools.staticfile.filename' : "interfaces/" + htpc.interfacefolder + "/static/img/" + file
            }

    jsFiles = os.listdir(os.path.join(interfaceDefaultStatic, 'js/'))
    for file in jsFiles:
        updatePath = os.path.join(interfaceThemeStatic, 'js/');
        updateFile = os.path.join(updatePath, file)
        if os.path.isfile(updateFile):
            appConfig['/js/' + file] = {
                'tools.staticfile.on' : True,
                'tools.staticfile.filename' : "interfaces/" + htpc.interfacefolder + "/static/js/" + file
            }
			
	jsFunctionFiles = os.listdir(os.path.join(interfaceDefaultStatic, 'js/functions/'))
    for file in jsFunctionFiles:
        updatePath = os.path.join(interfaceThemeStatic, 'js/functions/');
        updateFile = os.path.join(updatePath, file)
        if os.path.isfile(updateFile):
            appConfig['/js/functions/' + file] = {
                'tools.staticfile.on' : True,
                'tools.staticfile.filename' : "interfaces/" + htpc.interfacefolder + "/static/js/functions/" + file
            }

# Page inladen
page = htpc.pageHandler(htpc.root)

# Root mounten
cherrypy.tree.mount(page, "/", config=appConfig)

# Cherrypy starten
cherrypy.process.servers.check_port(htpc.host, htpc.port)
cherrypy.server.start()
