
call plug#begin()
" Plug 'repositorio'

"Status Bar, themes and colorschemes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

"Markdownpreview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"--markdown composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

"--markdown tables
Plug 'dhruvasagar/vim-table-mode'

"Markdown Syntax
Plug 'https://github.com/plasticboy/vim-markdown'

"Autocmplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Latex
Plug 'lervag/vimtex'

"colors
Plug 'https://github.com/ap/vim-css-color'

" Git
Plug 'https://github.com/tpope/vim-fugitive'

"floating terminal
Plug 'voldikss/vim-floaterm'

"better Syntax support
Plug 'sheerun/vim-polyglot'

"keymap
Plug 'liuchengxu/vim-which-key'

"Codi
"Plug 'metakirby5/codi.vim'

"VIm wiki
"Plug 'vimwiki/vimwiki'

"Vim in firefox
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

"star page
Plug 'mhinz/vim-startify'

"arduino ide
Plug 'stevearc/vim-arduino'

"smart autopairs
Plug 'https://github.com/jiangmiao/auto-pairs'

"vim clap
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

"LSP tags
Plug 'liuchengxu/vista.vim'

"Dracula colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
