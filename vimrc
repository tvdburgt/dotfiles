" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" include Go goodness
if isdirectory($GOROOT)
	set rtp+=$GOROOT/misc/vim
endif

syntax on
filetype plugin indent on
let mapleader = ','
set number
set hidden
set cursorline
set title
set scrolloff=5
set wildmenu


" disable a.vim
let g:loaded_alternateFile = 1

" write with root permissions
cmap w!! w !sudo tee >/dev/null %

" keep swap and backup files centralized, if possible
set backupdir=~/.tmp,.
set directory=~/.tmp,.

" c-style indentation
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab 

set textwidth=80

autocmd FileType html set shiftwidth=2 softtabstop=2
autocmd FileType c map <F9> :!gcc -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
nmap <F5> :w<CR>:make %:r && ./%:r<CR>
nmap <F6> :w<CR>:make %:r<CR>

" :w alias
command! W w

" visual
" colorscheme hybrid
colorscheme jellybeans
" colorscheme seoul256
set laststatus=2                " always show statusline

" mapping and key code delay (timeout)
set timeoutlen=1000 ttimeoutlen=0

" mappings
" yank-till-eol alias
nnoremap Y y$
noremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>f :Ack 
nnoremap <leader>a :A<CR>


" crop current window
nnoremap <leader>c :only<CR> 
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>s <C-w>v<C-w>l
nnoremap <Leader>p :set paste!<CR>


" up/down in wrapped lines
nnoremap j gj
nnoremap k gk


" window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-q> <C-w>c

" searching
set ignorecase                  " disable case sensitivity by default
set smartcase                   " enable case sensitive search for patterns with uppercase chars
set gdefault                    " use global flag by default

" file-specific commands
autocmd! BufWritePost .vimrc nested source %       " automatically source this file
autocmd FileType go set commentstring=//\ %s

" nerd tree
let NERDTreeShowBookmarks       = 1 " show bookmarks by default
let NERDTreeMinimalUI           = 1 " remove some clutter
"let NERDTreeQuitOnOpen          = 1 " quit tree after opening a file
let NERDTreeChDirMode           = 2 " automatically cd to tree root

let g:syntastic_cpp_compiler_options = '-std=c++11'

" split windows to the right and bottom
set splitbelow
set splitright

" show (partial) Vim command
set showcmd

" use shared system clipboard
set clipboard=unnamed

" let syntastic use location list for errors
let g:syntastic_always_populate_loc_list = 1
