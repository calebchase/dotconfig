"{{{ Maps
" coc
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" chadtree
nnoremap <Space>c <cmd>CHADopen<cr>
nnoremap <Space>s <cmd>set spell! spelllang=en_us<cr>
nnoremap <Space> <NOP>
nnoremap <esc><esc> :noh<return>
"}}}

"{{{ Sets
set number relativenumber
set nu rnu
set colorcolumn=100
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set scrolloff=5
set foldmethod=marker
"}}}

"{{{ Funcs
augroup SaveManualFolds
    autocmd!
    au BufWinEnter           ?* silent! loadview
augroup END

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

"{{{ Plugins
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()
"}}}

"{{{ Lua Configs
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"javascript", "java", "c", "python", "lua", "json", "cpp", "html", "css"}, 
  highlight = {
    enable = true,
  },
}
EOF
"}}}

"{{{ Nord Theming 
colorscheme Nord
let g:chadtree_settings = {"theme.text_colour_set": "nord"} 
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }
"}}}


