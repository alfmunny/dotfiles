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
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'honza/vim-snippets'

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
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF', {'do' : './install.sh' } 
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'vim-syntastic/syntastic'
" Plug 'davidhalter/jedi-vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mhinz/vim-startify' 
Plug 'plasticboy/vim-markdown'
"Plug 'python-mode/python-mode'
Plug 'tpope/vim-rails'
Plug 'tamago324/LeaderF-filer'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dhruvasagar/vim-table-mode'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Python

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

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
set backspace=indent,eol,start
filetype plugin on
filetype indent on
set nu
syntax on
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python,ruby,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType md setlocal spell spelllang=en_us

"au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
au BufEnter *.c set makeprg=gcc\ %\ -o\ %<.out
au BufEnter *.cpp set makeprg=g++\ -std=c++14\ -IDependencies\ %\ -o\ %<.out
au BufEnter *.java set makeprg=javac\ %

au BufEnter *.c nnoremap <F5> :make && ./%<.out<CR>
au BufEnter *.cpp nnoremap <F5> :make && ./%<.out<CR>
au BufEnter *.cpp nnoremap <F6> :!./build.sh && ./run.sh<CR>
au BufEnter *.cpp nnoremap <F7> :!./test.sh<CR>
au BufEnter *.cpp nnoremap <leader>ac :make && ./%<.out < data.txt<CR>
au BufEnter *.py nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<CR>
au BufEnter *.rb nnoremap <buffer> <F5> :exec '!ruby' shellescape(@%, 1)<CR>
"http://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers
au BufEnter *.java noremap <buffer> <F5> :make && java -ea <C-R>=expand('%:t:r')<CR> < data.txt<CR>

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" map leader
let mapleader = ","
let g:mapleader = ","

if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    let &t_Co = 256
    colorscheme gruvbox
endif
set bg=dark

map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>pp :setlocal paste!<cr>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
map <silent> <leader><cr> :noh<cr>

" Copy
map <leader>cp :%w !pbcopy<CR><CR>

" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabFree()) | q | endif
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'class']
let g:webdevicons_conseal_nerdtree_brackets=1

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" for vim running in tmux on OSX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Buffer
" Close current buffer
map <leader>bd :bd<cr>
" Close all buffers
map <leader>ba :1,1000 bd!<cr>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>bo :w \| %bd \| e#<CR>
map <leader>e :e! ~/.vimrc<CR>
map <leader>. :source ~/.vimrc<CR>
map <leader>nq :e! ~/Projects/blog/notes-blog/source/_posts/quick-notes.md<CR>
map <leader>nb :FZF ~/Projects/blog/notes-blog/source/_posts<CR>
autocmd! bufwritepost vimrc source ~/.vimrc
map <leader>q :e ~/buffer<CR>
" alternate buffer
nnoremap <BS> <C-^>

" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_Ctags = "/usr/local/Cellar/universal-ctags/HEAD-01b9fc8/bin/ctags"
let g:Lf_WindowHeight = 0.3
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShowDevIcons = 1
let g:Lf_FilerShowPromptPath = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

map <Space>l <leader>ff
map <Space>f :Leaderf filer<CR>
map <Space>b <leader>fb
map <Space>m <leader>fm

map <leader><C-f> :<C-U><C-R>=printf("Leaderf rg")<CR><CR>
map <leader><C-n> :<C-U><C-R>=printf("Leaderf file /Users/yzhang/Projects/notes/")<CR><CR>

nnoremap <leader>fu :LeaderfFunction!<CR>
nnoremap <leader>fk :<C-U><C-R>=printf("Leaderf --nowrap task")<CR><CR>
" rg in current buffer
noremap <leader>rb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <leader>rf :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
"nnoremap <silent><leader><leader><CR> :Rg! <C-R>=expand("<cword>") 
"should use `Leaderf gtags --update` first
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! gtags")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" search
" nnoremap ,f :FZF<CR>
" map <leader>g :Rg
" map <leader>a :Ack! 

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
map <leader>tN :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tp :tabprevious<CR>
map <leader>tn :tabnext<CR>
cno $h e ~/

" git
map <leader><leader>gs :Gstatus<CR>
map <leader><leader>gp :Gpush<CR>

try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" let g:pymode = 1
"
" Coc
set signcolumn=yes


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" inoremap <silent><expr> <c-space> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

map <F9> :Format<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementaion)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
nmap <leader>rn <Plug>(coc-rename)

"let g:vista_icon_indent = [">", ""]
nmap <leader>v :Vista!!<CR>
let g:vista_default_executive = 'coc'
let g:vista_executive_for = {
  \ 'markdown': 'toc',
  \ }
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 2
"let g:vim_markdown_toc_autofit = 1
"
function SwitchColor()
  if (g:colors_name == 'gruvbox') 
    syntax off
    set bg=light
    colorscheme PaperColor
  else
    colorscheme
    syntax on
    set bg=dark
    colorscheme gruvbox 
  endif
endfunction

nmap <F2> :call SwitchColor()<CR>

let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'external'

function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
			\ 'help' : 'navigate available tasks from asynctasks.vim',
		\ }
