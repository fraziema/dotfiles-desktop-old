
" split and join lines using leader
nmap <leader>i i<CR><Esc>
nmap <leader>j J

    " edit vimrc/bashrc and load vimrc bindings
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>eb :vsp ~/.bashrc<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>

inoremap <F4> $$<ESC>i
inoremap <F6> $$$$<ESC>hi
inoremap <F8> \begin{align*}<CR><CR>\end{align*}<ESC>ki



