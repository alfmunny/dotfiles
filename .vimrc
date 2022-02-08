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

" Plug 'honza/vim-snippets'

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
Plug 'skywind3000/asyncrun.extra'
Plug 'voldikss/vim-floaterm'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-dirvish'
" Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'skanehira/preview-uml.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'

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
set wildmenu
set nu
"set showcmd

filetype plugin on
filetype indent on
syntax on

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python,ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c,cpp,h,hpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
"autocmd FileType md setlocal spell spelllang=en_us

"au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
au BufEnter *.java set makeprg=javac\ %

au BufEnter *.c set makeprg=gcc\ %\ -o\ %<.out
au BufEnter *.c nnoremap <F5> :make && ./%<.out<CR>

"au BufEnter *.cpp set makeprg=g++\ -std=c++14\ -IDependencies\ %\ -o\ %<.out
au BufEnter *.cpp set makeprg=make
au BufEnter *.cpp nnoremap <F5> :make && ./%<.out<CR>
"au BufEnter *.cpp nnoremap <F6> :!./build.sh && ./run.sh<CR>
au BufEnter *.cpp nnoremap <F7> :!./test.sh<CR>
au BufEnter *.cpp nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake .<cr>
au BufEnter *.cpp nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test<cr>
au BufEnter *.cpp nnoremap <silent> <F7> :AsyncRun -cwd=<root> make<cr>
au BufEnter *.cpp nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run<cr>
au BufEnter *.cpp nnoremap <leader>ac :make && ./%<.out < data.txt<CR>
au BufEnter *.uml set makeprg=java\ -jar\ ~/Downloads/plantuml.jar\ %
au BufEnter *.uml nnoremap <silent> <F5> :make && open ./%<.png<CR>

au BufEnter *.go nnoremap <F5> :GoRun<CR>
au BufEnter *.go nnoremap <F6> :!go test -v<CR>
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
" map <leader>cp :%w !xclip -i -sel c<CR><CR>

" Repeat last commandline
map <space>r @:

" Run current line
map <leader><leader>rs yyp:. !sh<CR>
map <leader><leader>rp :.w !python<CR>
map <leader><leader>rr :.w !ruby<CR>

" NERDTree
let NERDTreeHijackNetrw=1
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
map <leader>nb :FZF ~/Projects/cheatsheets<CR>
autocmd! bufwritepost vimrc source ~/.vimrc
map <leader>q :e ~/buffer<CR>
" alternate buffer
nnoremap <BS> <C-^>

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Ctrl-P <Enter> | **
" Format a table
nmap gat <Plug>(EasyAlign)ip*\|

"Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"let g:Lf_Ctags = "/opt/homebrew/bin/ctags"
let g:Lf_Ctags = "/usr/local/bin/ctags"
let g:Lf_WindowHeight = 0.3
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShowDevIcons = 1
let g:Lf_FilerShowPromptPath = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
noremap <Space>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <Space>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <Space>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <Space>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

map <Space>l <leader>ff
map <leader><C-n> :<C-U><C-R>=printf("Leaderf file ~/Projects/Computer-Science-Notes/Notes")<CR><CR>
" map <Space>f :Leaderf filer<CR>
map <Space>b <Space>fb
map <Space>m <Space>fm

" rg search in Leaderf
let g:Lf_PreviewResult = {'Rg': 1}
map <leader>rg :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
" find word in files
"noremap <leader>rf :<C-U><C-R>=printf("Leaderf! rg -e %s --heading -C3", expand("<cword>"))<CR><CR>
noremap <leader>rf :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR><CR>
" find word in current buffer
noremap <leader>rb :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR><CR>
" 
xnoremap <leader>rf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap <leader>rr :<C-U>Leaderf! rg --recall<CR>
"nnoremap <silent><leader><leader><CR> :Rg! <C-R>=expand("<cword>") 

nnoremap <leader>fu :LeaderfFunction<CR>
nnoremap <leader>fk :<C-U><C-R>=printf("Leaderf --nowrap task")<CR><CR>
"should use `Leaderf gtags --update` first
let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
"let $GTAGSCONF = '/opt/homebrew/share/gtags/gtags.conf'
let g:Lf_GtagsAutoGenerate = 1
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
map <leader><leader>gs :Git<CR>
map <leader><leader>gp :Git push<CR>
map <leader><leader>gb :Git blame<CR>
map <leader><leader>gl :Git log<CR>

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

set signcolumn=yes

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" let g:coc_snippet_next = '<tab>'

" inoremap <silent><expr> <c-space> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

"map <F9> :Format<CR>
" autocmd BufWrite *.h,*.cc,*.cpp Format

"
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementaion)
nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
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
"let g:vista_default_executive = 'coc'
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

" :AsyncRun -mode=term -pos=floaterm  ls -la
" :AsyncRun -mode=term -pos=floaterm -position=bottomright -width=0.4  ls -la
" :AsyncRun -mode=term -pos=floaterm -focus=0  ls -la
let g:dirvish_relative_paths = 0

" let g:floaterm_keymap_toggle = '<F12>'
" let g:floaterm_keymap_new = '<leader>te'
" let g:flaoterm_autoclose = 2

let g:asyncrun_open = 10
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<CR>

let g:preview_uml_url='http://localhost:8080'


" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_cache_dir = expand('~/.cache/tags')
