fx_version 'cerulean'
game 'gta5'

shared_script '@es_extended/imports.lua'

ui_page 'ui/index.html'

client_scripts {
    'client/main.lua'
} 

server_scripts {
    'server/main.lua'
}

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}
 
lua54 'yes'