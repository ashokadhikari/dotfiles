" vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Theme
Plugin 'altercation/vim-colors-solarized'

" File path indexer and matcher
Plugin 'kien/ctrlp.vim'
" Python matcher for ctrlp instead of default one
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'JazzCore/ctrlp-cmatcher'

" Tab Completion; ./install.sh required inside YCM dir
Plugin 'Valloric/YouCompleteMe'

" nerd-tree-tabs
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Menu for displaying plugins
"Plugin 'mbadran/headlights'

" git integration in Vim
Plugin 'tpope/vim-fugitive'

" for moving code blocks
"Plugin 'tpope/vim-unimpaired'

" code commenter for different languages
Plugin 'scrooloose/nerdcommenter'

" statusline
Plugin 'bling/vim-airline'

" highlight trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

" ack.vim
Plugin 'mileszs/ack.vim'

" ag.vim
Plugin 'rking/ag.vim'

Plugin 'ternjs/tern_for_vim'

" syntax checker
"Plugin 'scrooloose/syntastic'

" python mode
"Plugin 'klen/python-mode'

" javascript mode
"Plugin 'pangloss/vim-javascript'

" syntax hightlighting and indentation for jade
"Plugin 'digitaltoad/vim-jade'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"if filereadable(expand("~/.vimrc_my"))
"  source ~/.vimrc_my
"endif

" set <leader>
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins related
map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>m <plug>NERDTreeMirrorToggle<CR>

" disable scrollbar in Nerdtree
:set guioptions-=L

" disable nerdtree_tabs on gui startup
let g:nerdtree_tabs_open_on_gui_startup = 0

" hide *.pyc files in nerdtree
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" disable NerdTree refresh on focus
"autocmd! AuNERDTreeCmd FocusGained
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" speed up indexing ctrlp with custom command
let g:ctrlp_user_command = 'find %s -type f'

" default behavior seems to clear cache, so disable that
" let g:ctrlp_clear_cache_on_exit = 0

" speed up matching ctrlp using python plugin
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move between windows
nnoremap <C-h> <Esc><C-w>h<CR>
nnoremap <C-j> <Esc><C-w>j<CR>
nnoremap <C-k> <Esc><C-w>k<CR>
nnoremap <C-l> <Esc><C-w>l<CR>

" switching buffers
map <leader>bn <esc>:bn<cr>
map <leader>bp <esc>:bp<cr>
map <leader>bd <esc>:bd<cr>

" explorer of pwd
nnoremap <leader>e <esc>:Explore<cr>

" remove trailing whitespace
nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<cr>

" clear last search's highlight
nnoremap <leader>h <esc>:noh<cr>

" mapping for toggling background
call togglebg#map("<leader>bg")

" find files containting pattern
nnoremap <leader>ag :Ag 
nnoremap <leader>ack :Ack 

" save in insert mode
inoremap <leader>w <c-o>:w<cr>

" execute command mode
nnoremap <leader>x :!

" squash git commit message
nnoremap <leader>sq 4jd3j


syntax on
if has("gui_running")
  colorscheme solarized
  "set background=dark
else
  color default
endif

" set font:size
set guifont=Monaco:h12

" show line num
set number

" show status line
set laststatus=2

" copy last line indent
set autoindent

" by default, the indent is 2 spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4

" for html/jade files, 2 spaces
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css  setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype less setlocal ts=2 sts=2 sw=2 expandtab

" for python/js files, 4 spaces
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype java       setlocal ts=4 sts=4 sw=4 expandtab

" wrap long lines
set wrap

" copy to clipboard also with yy, D, and P
" disable macvim sound
set visualbell

" case insensitive search
set ignorecase

" if any char is Uppercase, it will be case sensitive though
set smartcase

" incremental search
set incsearch

" highlight all matches"
set hlsearch

" Hide tilde past end of file
hi NonText guifg=bg

" Store swap files in fixed location, not current directory.
set dir=~/.vim/swap/

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

"set clipboard=unnamed

" 'find-next' stops at EOF
"set nowrapscan

" open file in new tab
"let NERDTreeMapOpenInTab='<ENTER>'

set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
" load local .vimrc
set exrc


" save sessions with .vis extension
map <leader>ms :mksession! vimsessions/

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

" generate ctags
nnoremap <leader>gt :!ctags -R<cr>
nnoremap <leader>gp :!ctags -R --languages=python<cr>
nnoremap <leader>gj :!ctags -R --languages=javascript<cr>
