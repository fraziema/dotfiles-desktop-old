" Color - related settings
set termguicolors
set t_Co=256
set background=dark
"   colorscheme blackboard
colorscheme blackboard
syntax enable

" set tabs to 4 spaces, and actually use spaces 
" instead of tabs (expandtab)
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" set what the file and interface look like
set number      " line numbers 
set showmatch   " matching brackets are shown
set ruler       
set wildmenu    " visual autocomplete for command menu
filetype plugin indent on

set laststatus=2    " turn on statusline; turn off with 0

" set search and find settings:
set incsearch 
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

" new key mappings 
let mapleader="\\"       " leader is backspace
nnoremap <leader><TAB> :call ToggleNumber()<CR>
source ~/.vim/keymaps.vim

" vim-tex settings
"let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_enabled = 1
let g:vimtex_quickfix_open_on_warning = 0




"setlocal spell spelllang=en_us
set nospell

set confirm     " ask prompt if command would fail normally (like quit w/o saving



