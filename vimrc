""set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
if !has('nvim')
  set nocompatible
endif

filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'mattn/webapi-vim'
Plug 'chiel92/vim-autoformat'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-liquid'
Plug 'keith/tmux.vim'
Plug 'tpope/vim-git'
Plug 'hdima/python-syntax'
Plug 'stephenway/postcss.vim'
Plug 'tpope/vim-markdown'
Plug 'mrzool/mustache.vim'
Plug 'StanAngeloff/php.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-vinegar'
" Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-smooth-scroll'

Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/grep.vim'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/syntastic'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'petRUShka/vim-magma'
" Plug 'petRUShka/vim-sage'

" bookmark
Plug 'MattesGroeger/vim-bookmarks'

"UltiSnips
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" completion
Plug 'maralla/completor.vim'

" Not used atm
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'tomasr/molokai'
" Plug 'altercation/vim-colors-solarized'
" Plug 'mrtazz/simplenote.vim'
" Plug 'junegunn/vim-xmark'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
" Plug '0x0dea/vim-molasses'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'liamcurry/tumblr.vim'
" Plug 'captbaritone/better-indent-support-for-php-with-html'
" Plug 'rust-lang/rust.vim'
" Plug 'cespare/vim-toml'
" Plug 'mattn/gist-vim'
" Plug 'rlue/vim-barbaric'

call plug#end()

" Load stock matchit.vim if no newer version available
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: General options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
  set encoding=utf8
endif

set history=700
set autoread
set fileformats=unix
set dictionary=/usr/share/dict/words

set tags=tags;/

let mapleader = " "
nnoremap <SPACE> <Nop>

" Treat numerals as decimal
set nrformats -=octal

" How much time does Vim wait between keystrokes in composite commands
set ttimeout
set ttimeoutlen=100

" Persistent undos
set undodir=$HOME/.vim/tmp/undo//
set undofile
set undolevels=5000

" Save and restore marks, registers content,
" command-line history, search pattern history
set viminfo='1000,<500,:500,/500

" Get mouse working when running Vim in tmux
if !has('nvim')
  set ttymouse=xterm2
endif

" Configure backspace
set backspace=eol,start,indent
" Actually disable backspace so I just use <C-h>
" inoremap <BS> <Nop>

" Jump to next/previous line when moving left/right
" set whichwrap+=<,>

" Do not store global, local values or folds in a session 
set ssop-=options
set ssop-=folds

" Activate modeline
set modeline

" Make yank repeatable with .
set cpoptions+=y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Files and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A buffer becomes hidden when it is abandoned
set hidden

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" K opens help section for word under cursor
" useful when editing the vimrc
autocmd FileType vim setlocal keywordprg=:help

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Save all buffers when focus is lost
autocmd FocusLost * silent! wa

set autowrite

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Search and completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Substitute globally on lines
set gdefault

" Search tweaks
set ignorecase
set smartcase
set incsearch

" Turn magic on for regex
set magic

" Set path as project path and search it recursively
" (fixes 'file not found' error when using `gf`)
set path+=$PWD/**

" Autocompletion settings
set complete=.,w,b,u,t,i,t,kspell " Pull from current file, buffers in other windows and in the buffer list, and current tags
set wildmenu " Turn on wildmenu
set wildmode=longest,list:longest " How text gets replaced
set wildignore=*.o,*~,*.pyc " Ignore compiled files when autocompleting


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Text and whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not fold, ever
" set nofoldenable

" Insert space characters whenever the tab key is pressed
set expandtab
" How many spaces for a tab
set tabstop=2
" How many spaces for indentation
set shiftwidth=2
set smarttab
" set tw=500
set autoindent
" set cindent

" Wrap related
" set nowrap " Leave text alone unless otherwise specified
set textwidth=0 " Never insert line-breaks in text
set wrapmargin=0

" Wrap text in markdown, yaml and txt files
autocmd BufNewFile,BufRead,BufEnter *.md setlocal wrap linebreak
autocmd FileType markdown setlocal wrap linebreak
autocmd BufNewFile,BufRead,BufEnter *.yml setlocal wrap linebreak
autocmd FileType yaml setlocal wrap linebreak
autocmd BufNewFile,BufRead,BufEnter *.txt setlocal wrap linebreak
autocmd FileType text setlocal wrap linebreak

" Turn on spell-checking for Markdown files
" autocmd BufRead,BufNewFile *.md setlocal spell

" Insert space before every line break for format=flowed to work
autocmd FileType mail setlocal formatoptions+=aw

" " Highlight whitespace with symbols
" set list
" set listchars=eol:¬,extends:…,precedes:…,tab:\ \ 

" Makes foo-bar considered one word
" set iskeyword+=-

" Consider < and > a pair
" set matchpairs+=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Improve smoothness
if !has('nvim')
  set ttyfast
endif

" Don't highlight search results
set nohlsearch

" Don't redraw while executing macros
set lazyredraw

" Show partially typed commands at the bottom
set showcmd

" Improves scrolling when wrap is set
" See http://vi.stackexchange.com/questions/4507/scrolling-issues-when-the-wrap-option-is-set
set display=lastline

" Keep cursor 5 lines from window borders when scrolling
set scrolloff=5

" show current position
set ruler

" Height of the command bar
set cmdheight=1

" Always show the status line
set laststatus=2

" Status line
set statusline=%t   " File name of the file in the buffer
set statusline+=%m  " Modified flag
set statusline+=%5{v:register} "Which active register
set statusline+=%=  " Align to the right from now on
set statusline+=[%{fugitive#head()}]   " Current branch
set statusline+=\ \  " Blank space
set statusline+=%y   " Type of file in the buffer
set statusline+=%5l  " Current line
set statusline+=,    " Comma
set statusline+=%c   " Current Column
set statusline+=/    " Slash
set statusline+=%-5L " Total lines
set statusline+=%p%% " Percentage through the file

" Highlight status bar when in insert mode
" if version >= 700
"   au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
"   au InsertLeave * hi StatusLine ctermbg=19 ctermfg=20
" endif

" hide default mode indicator
" set noshowmode

" Switch cursor shape when changing modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" Switch cursor shape when using NeoVim
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" Number of colors
set t_Co=256

syntax enable

" Colorscheme settings
" if has("unix")
"   let s:uname = system("uname")
"   if s:uname == "Darwin\n"
"     " Settings for iTerm2 on OS X
"     set background=dark
"     let base16colorspace=256
"     colorscheme base16-ocean
"     hi Normal guibg=NONE ctermbg=NONE
"   else
"     " Settings for Terminator on Linux
"     let g:molokai_original=1
"     let g:rehash256=1
"     colorscheme molokai
"     " Transparent background
"     hi Normal guibg=NONE ctermbg=NONE
"   endif
" endif

set termguicolors

" Display comments in italics
highlight Comment cterm=italic

" Italics and bold in markdown files
highlight htmlItalic cterm=italic
highlight htmlBold cterm=bold

" Transparency wizardry
highlight VertSplit ctermfg=244 ctermbg=NONE guibg=NONE
highlight FoldColumn ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight GitGutterAdd ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermbg=NONE guibg=NONE

" Red background for misspelled words
highlight clear SpellBad
highlight SpellBad ctermbg=01 ctermfg=00

" Line numbers tweaks
set number
set numberwidth=2
set foldcolumn=0

" Open vertical splits to the right
set splitright

" Show tab bar if there are at least two tabs
set showtabline=1

" Show matching brackets
set showmatch
set matchtime=15

" No bells
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=300

" Make links in help pages stand out
set conceallevel=0
hi link HelpBar Normal 
hi link HelpStar Normal

" Smaller help window
set helpheight=12

" Sensible horizontal scrolling
" (https://ddrscott.github.io/blog/2016/sidescroll/)
set sidescroll=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev teh the
inoreabbrev usign using
inoreabbrev lokk look
inoreabbrev hwo how
inoreabbrev amoutn amount
inoreabbrev desing design
inoreabbrev fucntion function


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit vimrc
command! E execute 'edit ' . resolve(expand($MYVIMRC)) | lcd %:p:h

"------------------------------------------------------------
" Custom mappings

" Maps jj to esc
inoremap jj <Esc>

" Break undo sequence in insert mode when certain actions are performed
" See http://vi.stackexchange.com/questions/4556/undo-in-insert-mode/4558#455
" Interfering with DelimitMate, commenting out
" inoremap <CR> <C-G>u<CR>
" inoremap <C-R> <C-G>u<C-R>

" Remap VIM 0 to first non-blank character
noremap 0 ^

" make Y behave like D and C
nnoremap Y y$

" Insert line break
nnoremap <CR><CR> i<CR><ESC>

" Move per visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move per real line
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

" Searches for current selection in visual mode
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" Expands path of current buffer on the command prompt
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remap <c-w>o to open current buffer in a new tab
" Mimics zoom in on current split
nnoremap <c-w>o :tab sp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Leader mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tex related
nnoremap <Leader>a :!{arara %}<CR><CR>
nnoremap <Leader>av :!{arara -v %}<CR>
" nnoremap <Leader><Leader> :silent !evince '%:r'.pdf<CR>
nnoremap <Leader><Leader> :silent !zathura '%:r'.pdf&<CR>

" musty related

" delete  line breaks throughout current buffer
" doesn't work but here for reminder
" ctrl-v ctrl-M
" nnoremap <Leader>a :%s///g<CR>

" Open file explorer
nnoremap <Leader>e  :e.<CR>
nnoremap <Leader>v  :Vex!<CR>
nnoremap <Leader>s  :Hex<CR>
nnoremap <Leader>t  :Tex<CR>

" nnoremap <Leader>l :lcd ../
nnoremap <Leader>o :!open<Space>

" Git-related
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
" nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gv :Gcommit -v <CR>
nnoremap <space>gc :Gcommit -v -m 
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
" nnoremap <Leader>ga :Git add %<CR>
" nnoremap SS :Gstatus<CR>
" " nnoremap <Leader>a :exe ":GitGutterStageHunk"<CR>
" nnoremap <Leader>c :Gcommit -m 
" " command! Hpreview GitGutterPreviewHunk
" " command! Hnext GitGutterNextHunk
" " command! Hprev GitGutterPrevHunk

" Update git-gutter signs as soon as possible after stop typing event
" set updatetime=100

" Copy/paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Toggle Gundo
nnoremap <Leader>G :GundoToggle<CR>

" Toggle Goyo
nnoremap <Leader>z :set nolist<CR>:Goyo<CR>

" Ag after selected text
vnoremap <silent> ag :call VisualSelection('gv', '')<CR>
" Search & replace selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Run :Make
nnoremap <leader>m :Make<CR>

" Enable/disable the mouse
nnoremap <leader>M :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == "a"
    set mouse=
  else
    set mouse=a
  endif
endfunction

" Move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Run Syntastic check
nnoremap <leader>sy :SyntasticCheck<cr>

" New buffer from visual selection
vnoremap <leader>n d:new<CR>P


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRZOOL: Plugins Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimtex
let maplocalleader="\\"
let g:vimtex_echo_ignore_wait = 1
" let g:tex_flavor = 'xelatex'
let g:tex_flavor = 'latex'
" EDGAR vimtex
" let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-g -r @line @pdf @tex'
" https://castel.dev/post/lecture-notes-1/
" let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

" vim-magma
" this is pretty hacky... :P
autocmd BufRead,BufNewFile *.mag  set filetype=magma omnifunc=CompleteMagma
autocmd BufRead,BufNewFile *.mag let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax
autocmd BufRead,BufNewFile *.mag cal SetSyn("matlab")
autocmd BufRead,BufNewFile *.mag cal SetSyn("magma")
autocmd BufRead,BufNewFile *.m  set filetype=magma omnifunc=CompleteMagma
autocmd BufRead,BufNewFile *.m let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax
autocmd BufRead,BufNewFile *.m cal SetSyn("matlab")
autocmd BufRead,BufNewFile *.m cal SetSyn("magma")

" Sagemath settings (from Franco Saliola)
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %

" easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
"
" or
"
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Netrw Settings
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_browsex_viewer = 'google-chrome'
let g:netrw_http_xcmd= "-o" " use curl to open http links
if expand('%:p') =~ 'dotfiles'
  let g:netrw_hide=0 " Show hidden files if I'm in my dotfiles folder
  let g:ctrlp_show_hidden = 1 " Get CtrlP to show hidden files
endif

" Python syntax settings
let python_version_2 = 1
let python_highlight_all = 1

" CtrlP settings
let g:ctrlp_map = 'FF'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|_site|output)|(\.(swp|ico|git|svn))$'

" Gundo settings
let g:gundo_preview_bottom = 1

" Syntastic settings
let g:syntastic_html_tidy_ignore_errors = [
			\ 'trimming empty <i>',
			\ 'trimming empty <span>',
			\ '<input> proprietary attribute \"autocomplete\"',
			\ 'proprietary attribute \"role\"',
			\ 'proprietary attribute \"hidden\"',
			\ 'proprietary attribute \"ng-',
			\ '<svg> is not recognized!',
			\ 'discarding unexpected <svg>',
			\ 'discarding unexpected </svg>',
			\ '<rect> is not recognized!',
			\ 'discarding unexpected <rect>',
			\ '<circle> is not recognized!',
			\ 'discarding unexpected <circle>',
			\ '<text> is not recognized!',
			\ 'discarding unexpected <text>',
			\ 'discarding unexpected </text>',
			\ '<path> is not recognized!',
			\ 'discarding unexpected <path>',
			\ '<desc> is not recognized!',
			\ 'discarding unexpected <desc>',
			\ 'discarding unexpected </desc>',
			\ '<g> is not recognized!',
			\ 'discarding unexpected <g>'
			\ ]

" Snipmate settings
" let g:snipMate = {}
" let g:snipMate.scope_aliases = {}
" let g:snipMate.scope_aliases['liquid'] = 'liquid,html' " loads HTML snippets in liquid files

" Goyo settings
let g:goyo_height = 70
let g:goyo_width = 100

function! s:goyo_enter()
  set noshowmode
  set scrolloff=999
endfunction

if !exists('*s:goyo_leave')
  function! s:goyo_leave()
    source $MYVIMRC
  endfunction
endif

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ack.vim settings
" use ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" vim-rsi settings
let g:rsi_no_meta = 1 " Fixes ä issue

" DelimitMate Settings
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" Activate Ragtag shortcuts
let g:ragtag_global_maps = 1

" Smooth-scroll mappings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 25, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 25, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 25, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 25, 4)<CR>

" Set commentstring for php files
autocmd BufNewFile,BufRead,BufEnter *.php setlocal commentstring=//\ %s
autocmd FileType php setlocal commentstring=//\ %s

" Map for vim-autoformat
noremap <F3> :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completor Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
" colorscheme molokai       " set colorscheme
colorscheme zellner " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" " Prettify Vagrantfile
" autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
" if exists('+colorcolumn')
"   set colorcolumn=81
"   highlight ColorColumn ctermbg=red
" else
"   highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"   match OverLength /\%81v.\+/
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set number                " show line numbers
" set numberwidth=6         " make the number gutter 6 characters wide
" set cul                   " highlight current line
" set laststatus=2          " last window always has a statusline
" set nohlsearch            " Don't continue to highlight searched phrases.
" set incsearch             " But do highlight as you type your search.
" set ignorecase            " Make searches case-insensitive.
" set ruler                 " Always show info along bottom.
" set showmatch
" set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set autoindent            " auto-indent
" set tabstop=2             " tab spacing
" set softtabstop=2         " unify
" set shiftwidth=2          " indent/outdent by 2 columns
" set shiftround            " always indent/outdent to the nearest tabstop
" set expandtab             " use spaces instead of tabs
" set smartindent           " automatically insert one extra level of indentation
" set smarttab              " use tabs at the start of a line, spaces elsewhere
" "set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
set foldmethod=indent
" setlocal spell spelllang=en_us
" set shellcmdflag=-ic

" spelling
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Prettify JSON files making them easier to read
command PrettyJSON %!python -m json.tool
