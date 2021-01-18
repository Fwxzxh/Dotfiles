
"Powerline fornts
let g:airline_powerline_fonts = 1
set guifont=Source_Code_Pro_Light:h15:cANSI

 if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''

"Show Buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

"Vim Arduino
"autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{MyStatusLine()}'
