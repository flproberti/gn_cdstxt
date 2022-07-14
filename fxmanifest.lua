fx_version 'bodacious'
game 'gta5'

files {
	'ignore/events.meta',
	'ignore/relationships.dat',
	'visualsettings/visualsettings.dat',
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua',
	'config.lua',
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua',
	'config.lua',
}