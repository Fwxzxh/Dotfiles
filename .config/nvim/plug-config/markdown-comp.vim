
"markdown composer
let g:markdown_composer_browser = 'chromium' "Default browser
let g:markdown_composer_open_browser = 0 "Open browser manually 0=off
let g:markdown_composer_external_renderer='pandoc -f markdown -t html' "Pandoc inegration
let g:markdown_composer_refresh_rate = 0 "default 500
let g:markdown_composer_autostart =0 "start server w file is open 0=off
" TODO: Hacer script que mande un :ComposerUpdate cada vez que se guarde.
