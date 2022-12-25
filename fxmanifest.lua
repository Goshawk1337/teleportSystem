fx_version 'adamant'

game 'gta5'

Author 'Goshawk1337#7759'

description 'nv_TeleportSystem by Goshawk1337#7759'

version '1.0.0'
shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'config.lua',
    '/client/client.lua'
}

dependency 'nh-context'