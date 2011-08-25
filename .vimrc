"
"
" TODO:
" autocompletion/omnicompletion + ctags (supertab.vim)
" customize statusbar
" clipboard registe
" navigation marks
" vim backups
"
"

" load pathogen
call pathogen#infect()

" use vim features
set nocompatible

" syntax highlighting
syntax on

" line numbers
set number

" allow vim to set terminal title
set title

" highlight cursor line
"set cursorline

" display current line/column
set ruler

" show all completions when tabbing
set wildmenu

" indent stuff
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" ?
set autoindent
filetype plugin indent on

" personal modifier key
let mapleader = ','

" line margin when scrolling
set scrolloff=3

" mapping/keycode timeout
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" don't use (visual) bell
set vb t_vb=

" dynamic search matching
set incsearch

" highlight all search matches
"set hlsearch

" colorscheme
colors xoria256

" show statusbar
set laststatus=2

" retain correct indentation when pasting
" not working correctly..
"set paste

" ignore case for lowercase searches
"set ignorecase 
"set smartcase

" gvim settings
"if has('gui_running')
    " set font
    "set guifont=DeJaVu_Sans_Mono:h9:cANSI

    " no cursor blinking!
    "set guicursor+=a:blinkon0

    " get rid of gui stuff
    "set guioptions-=m
    "set guioptions-=T
"endif


" Make backspace work in all cases
set backspace=indent,eol,start


" Mappings
map <F2> :NERDTreeToggle<CR>

" scroll window by 3 lines
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" up/down in wrapped lines
nnoremap j gj
nnoremap k gk

" don't scroll further down than last line
nnoremap <expr> <C-f> IntelliScrollDown()

" window navigation with <C-{h,j,k,l}> keys
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-K> <C-W>k

" removes search coloring
noremap <ESC> <ESC>:set hlsearch!<CR>

" Window resize shortcuts
if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
    map <kDivide> <C-W>o
    map <KMultiply> <C-W>>
endif

" Barry Arthur
" 2011 06 22
func! IntelliScrollDown()
  let fwl = line('w0')
  let lwl = line('w$')
  let lbl = line('$')
  if (lbl - lwl) >= (lwl - fwl)
    return "\<c-f>"
  else
    return "\<c-d>"
  endif
endfunc
