set shiftwidth=2
set softtabstop=2

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" vim-plug settings
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'

call plug#end()

" Ale config
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = ['eslint', 'prettier']
let g:ale_fix_on_save = 1
