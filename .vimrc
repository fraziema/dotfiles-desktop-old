" Color - related settings
set termguicolors
set t_Co=256
set background=dark
"   colorscheme blackboard
colorscheme breezy
syntax enable

" set tabs to 2 spaces, and actually use spaces 
" instead of tabs (expandtab)
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" set what the file and interface look like
set number      " line numbers 
set showmatch   " matching brackets are shown
set ruler       
set wildmenu    " visual autocomplete for command menu
filetype plugin indent on

set laststatus=2    " turn on statusline; turn off with 0

" set search and find settings:
set incsearch 
set nohlsearch
"set path+=**

" set file browsing
let g:netrw_banner=0        "no banner
let g:netrw_browse_split=2  "use same window
let g:netrw_altv=1          "vsplit right
let g:netrw_liststyle=3     " tree view


" folding  (space open/closes folds)
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
nnoremap <space> za

" new key mappings 
let mapleader="\\"       " leader is backspace

nnoremap <leader><TAB> :call ToggleNumber()<CR>

" split and join lines using leader
nmap <leader>i i<CR><Esc>
nmap <leader>j J

nnoremap <F2> i<CR><ESC>k:r!date +\%Y-\%b-\%d<CR><ESC>kJxJx<ESC>

    " edit vimrc/zshrc and load vimrc bindings
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>eb :vsp ~/.bashrc<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>

" backup settings
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set writebackup

"functions
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


"setlocal spell spelllang=en_us
set nospell

set confirm     " ask prompt if command would fail normally (like quit w/o saving



