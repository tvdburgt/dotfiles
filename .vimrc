" Don't use vi compatibility mode
set nocompatible

" Syntax highlighting
syntax on

" Show line numbers
set number

" Highlight cursor line
set cursorline

" Show line number and column of cursor
set ruler

" Indentation settings
set expandtab
set shiftwidth=4
set softtabstop=4

" Let vim figure out when to indent
filetype indent on

" Indent when pasting
" Not working...
set paste

" Real time search feedback
set incsearch

colorscheme github

" Font
if has('gui_running')
    " Set font
    set guifont=DeJaVu_Sans_Mono:h9:cANSI

    " Disable cursor blinking
    set guicursor+=a:blinkon0

    " Disable some of GUI stuff
    set guioptions-=m
    set guioptions-=T
endif


" Make backspace work in all cases
set backspace=indent,eol,start


" Mappings
map <F2> :NERDTreeToggle ~/projects<CR>

" Window resize shortcuts
if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
    map <kDivide> <C-W><
    map <KMultiply> <C-W>>
endif

