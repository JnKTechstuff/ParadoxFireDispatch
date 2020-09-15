fx_version 'bodacious'
game 'gta5'

author 'JnKTechstuff'
title 'Paradox Fire Script'
description 'Fire Script and Event Handler'
version '1.0'

shared_script '@extendedmode/imports.lua'

server_scripts {
	'config.lua',
	'server/sv_firedispatch.lua',
	'server/sv_fire.lua',
}

client_scripts {
	'config.lua',
	'client/cl_fire.lua',
}