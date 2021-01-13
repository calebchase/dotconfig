call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'kevinoid/vim-jsonc'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme Nord

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

set relativenumber

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
