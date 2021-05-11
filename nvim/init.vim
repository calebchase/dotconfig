call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
call plug#end()

colorscheme Nord

let g:chadtree_settings = {"theme.text_colour_set": "nord"} 

nnoremap <Space>c <cmd>CHADopen<cr>
"nnoremap <leader>t <cmd>CHADopen --always-focus<cr>
"nnoremap <leader>g <cmd>CHADopen --always-focus<cr> <bar> <cmd>CHADopen --nofocus<cr>

"Toggle spell check
nnoremap <Space>s <cmd>set spell! spelllang=en_us<cr>

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
"Line number formating
set number relativenumber
set nu rnu

set colorcolumn=100

"Prevent space from moving cursor in normal mode
nnoremap <Space> <NOP>

"Turn off highlighting
nnoremap <esc><esc> :noh<return>

"Tab settings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"Always n lines above / below cursor
set scrolloff=5

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
