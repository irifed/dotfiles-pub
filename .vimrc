:imap jj <Esc>

" suppress errors if pathogen is not installed
silent! execute pathogen#infect()

colorscheme desert

set nocompatible
set autowrite

set history=1000
set undolevels=1000

set textwidth=120
set nowrap 
set linebreak

set autoindent
set smartindent

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set number
set ruler
set scrolloff=5

set foldenable
set foldcolumn=0
set foldmethod=marker "syntax
set foldmarker={{{,}}}

set switchbuf=useopen,usetab,newtab

set wildmenu
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

set formatoptions=c,q,r,t "Auto-wrap comments using textwidth

syntax on
filetype on
filetype indent on
filetype plugin on

set showmatch
set showcmd 
set showmode

set hlsearch
set incsearch

set ignorecase
set smartcase

set backspace=indent,eol,start whichwrap+=<,>,[,]

set showtabline=2
set title

set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

map <F1> :shell<CR>
map <F2> :w<CR>

" switch between hlsearch and nohlsearch
map <F3> :set hlsearch!<CR>

" Command Make will call make and then cwindow which
" " opens a 3 line error window if any errors are found.
" " If no errors, it closes any open cwindow.
:command -nargs=* Make make <args> | cwindow 3

map <F7> :Make<CR>
map <F8> :cn<CR>
map <F9> :cp<CR>

set diffopt=filler,iwhite,icase,context:3
if &diff
  nnoremap <C-Up> [c
  nnoremap <C-Down> ]c
  nnoremap <C-Left> do
  nnoremap <C-Right> dp
endif

" Simple comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>

" remove trailing spaces 
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\\s\\+$//e

" indent xml
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
