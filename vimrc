" initialize pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" include Go goodness
if isdirectory($GOROOT)
	set rtp+=$GOROOT/misc/vim
endif

" Essentials {{{
syntax on
filetype plugin indent on
" }}}
" let mapleader = ","
" let mapleader = "\<Space>"
set hidden
set wildmenu
set wildmode=longest:full,full
set foldmethod=marker
set textwidth=80

command! W w
command! WW w !sudo tee % > /dev/null

" nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <Leader>h :nohlsearch<CR>

" keep swap and backup files centralized, if possible
set backupdir=~/.tmp,.
set directory=~/.tmp,.

" Indentation {{{
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab 
" }}}

" Visual {{{
colorscheme hybrid
set laststatus=2
" set number
set relativenumber
set cursorline
set title
" }}}

" mapping and key code delay (timeout)
set timeoutlen=1000 ttimeoutlen=0

" mappings
" yank-till-eol alias
nnoremap Y y$
nnoremap <F2> :NERDTreeToggle<CR>

" up/down in wrapped lines
nnoremap j gj
nnoremap k gk

" Leader mappings {{{
nnoremap <Leader>a :Ack 
nnoremap <Leader>c :only<CR>
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>s :vsplit<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>e :ll<CR>
nnoremap <Leader>ft :set ft=
" }}}

" Window {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>c
" nnoremap <C-=> <C-w>=
nnoremap + 10<C-w>>
nnoremap - 10<C-w><
set splitbelow
set splitright
" }}}

" Search {{{
set ignorecase
set smartcase
set incsearch
" set hlsearch
" }}}


" invert global substitute flag 
set gdefault

" file-specific commands
au! BufWritePost $MYVIMRC nested source $MYVIMRC
au FileType go setlocal commentstring=//\ %s
au FileType go nnoremap <Leader>i :Import 
au FileType go nnoremap <Leader>f :Fmt<CR> 
au FileType go nnoremap <F5> :!go install<CR>
au FileType tex nnoremap <F5> :!pdflatex %<CR>
au FileType c nnoremap <F5> :make %:r && ./%:r<CR>
au FileType c nnoremap <F6> :make %:r<CR>
au FileType markdown setlocal spell
au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

nnoremap Q <Nop>


" show (partial) Vim command
set showcmd

" share default clipboard with X
set clipboard=unnamed,unnamedplus

" Plugin settings {{{
let NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1
" let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_compiler_options = "-std=c++11"
let g:ctrlp_working_path_mode = 0
let g:Powerline_symbols = "unicode"
" }}}
