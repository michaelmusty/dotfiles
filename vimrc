""set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
if !has('nvim')
  set nocompatible
endif

filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. Plugins
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
"set nowrap                " don't wrap text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Custom Commands                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
set foldmethod=indent
setlocal spell spelllang=en_us
set shellcmdflag=-ic

" Prettify JSON files making them easier to read
command PrettyJSON %!python -m json.tool
