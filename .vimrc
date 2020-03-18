map <F9> :!java %<CR>
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set autowrite
set autoread
set so=10
set hlsearch
set incsearch
set noerrorbells
set novisualbell
set foldcolumn=1
set nobackup
set nowb
set noswapfile
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set encoding=utf8
set ffs=unix,dos,mac
set ai "auto indent
set si "smart indent
set wrap "wrap lines
filetype plugin on
filetype indent on
set nu
syntax on
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %<
au BufEnter *.cpp set makeprg=g++\ -g\ -std=c+11\ %\ -o\ %<
au BufEnter *.c nnoremap <F5> :make && ./%<<CR>
au BufEnter *.cpp nnoremap <F5> :make && ./%<<CR>
au BufEnter *.py nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<CR>
au BufEnter *.rb nnoremap <buffer> <F5> :exec '!ruby' shellescape(@%, 1)<CR>

if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    let &t_Co = 256
    colorscheme molokai
else
    colorscheme delek
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>pp :setlocal paste!<cr>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
map <silent> <leader><cr> :noh<cr>

" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType.isTabFree()) | q | endif
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" map leader
" let mapleader = ","
" let g:mapleader = ","

" Buffer
" Close current buffer
map <leader>bd :bd<cr>
" Close all buffers
map <leader>ba :1,1000 bd!<cr>
nnoremap <silent><leader><leader><CR> :Rg! <C-R><C-W><CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>bo :w \| %bd \| e#<CR>
" alternate buffer
map <leader>e :e! ~/.vimrc<CR>
map <leader>. :source ~/.vimrc<CR>
nnoremap <BS> <C-^>
autocmd! bufwritepost vimrc source ~/.vimrc
map <leader>x :e ~/buffer.md<CR>
map <leader>q :e ~/buffer<CR>
nnoremap <leader>o :LeaderfBuffer<CR>

" search
nnoremap ,f :FZF<CR>
map <leader>g :Rg
map <leader>a :Ack! 

" tagbar
nmap <leader>ta :TagbarToggle<CR>
let g:tagbar_left = 1

" Rg 
nnoremap <silent><leader>g :Rg<CR>
if executable('rg')
    let g:ackprg = 'rg -S --no-heading --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" tab
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>t<leader> :tabnext
cno $h e ~/

"try
"    set undodir=~/.vim/undodir
"    set undofile
"catch
"endtry
"
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
