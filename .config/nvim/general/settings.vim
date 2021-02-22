" set leader key
let g:mapleader = "\<Space>"

colorscheme dracula
set termguicolors

set nu rnu  	"Set hybrid line numbers
set nowrap	"No cortar las lineas si se salen de la ventana
set incsearch	"buscar mientras escribes
set smartindent	"Indentación automatica
set mouse=a 	"mouse support

set ruler  	" Show the cursor position all the time
set noshowmode  " We don't need to see things like -- INSERT -- anymore
set cursorline  " Enable highlighting of the current line
set hidden      " Required to keep multiple buffers open multiple buffers
set formatoptions-=cro 	" Stop newline continution of comments
set nobackup      	" This is recommended by coc
set nowritebackup     	" This is recommended by coc
set autoread " Reload the file if changes

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
"set wildmode=longest,list,full

set updatetime=200 "markdown preview update time

set clipboard+=unnamedplus "use system clipboard

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

set cmdheight=1 "cmd height
