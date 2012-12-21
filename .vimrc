set nocompatible
syntax on

set background=light
set gfn=Monaco:h12

set autoindent
set cindent

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent

" highlight all matches"
set hlsearch

" search as you type
set incsearch

set showmatch
set ignorecase
set smartcase

set number
set ruler

filetype on
filetype plugin on

let mapleader=","

nnoremap <leader>c :NERDTreeTabsToggle<CR>
nnoremap <leader>v :TlistToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

"autocmd FileType python set omnifunc=pythoncomplete#Complete

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  elseif strpart( getline('.'), col('.')-3, 2) == '</'
    return "\<C-X>\<C-O>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" pasting from clipboard in insertmode
set pastetoggle=<F2>

" trim spaces when saving
"autocmd BufWritePre * :%s/\s\+$//e

nnoremap <F8> :!ctags -R --python-kinds=-i --languages=+python .<CR>
set tags+=$PYTHONPATH_TAGS

nnoremap <F7> :!pycscope -R `pwd`<CR>

" add cscope.out in pythonpath, generated by function pycscope-pythonpath in ~/.bash_profile"
" source ~/.vim/plugin/cscope-pythonpath.vim

" search cscope.out recursively until found
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

inoremap <D-r> <Esc>:w\|:!python %<CR>
nnoremap <D-r> <Esc>:w\|:!python %<CR>

nmap <D-1> <Esc>:tabp<CR>
imap <D-1> <Esc>:tabp<CR>
nmap <D-2> <Esc>:tabn<CR>
imap <D-2> <Esc>:tabn<CR>

nnoremap <C-h> <Esc><C-w>h<CR>
nnoremap <C-j> <Esc><C-w>j<CR>
nnoremap <C-k> <Esc><C-w>k<CR>
nnoremap <C-l> <Esc><C-w>l<CR>

set foldmethod=indent
set foldnestmax=2
set foldlevelstart=99
nnoremap <space> za
vnoremap <space> zf

" colorscheme koehler
" colorscheme mayansmoke
" colorscheme zenburn
colorscheme wombat

nnoremap <leader>t i<Tab><esc>l
nnoremap <leader>T i<backspace><esc>l

nnoremap <leader>e i<enter><esc>k<CR>
nnoremap <leader>E i<backspace><esc>l

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Open duplicate tab
nnoremap <silent><Leader><C-w>s <C-w>s<C-w>T<CR>

" Open ctags in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T<CR>

" bash like tab completion when opening file from vim
set wildmode=longest,list,full
set wildmenu

set statusline=%{fugitive#statusline()}
if !has('python')
    finish
endif

""" End for CLI vi"""

if has("gui_running")
    set guioptions=egmrt
endif

" change to the dir of current file
" this didn't work properly with nerdtreeplugin
"set autochdir

python << EOF
import vim
import sys
import os
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
