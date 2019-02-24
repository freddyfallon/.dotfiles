set shiftwidth=2
set softtabstop=2
set number

" vim-plug settings
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'takac/vim-hardtime'

call plug#end()

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" Ale config
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = ['eslint', 'prettier']
let g:ale_fix_on_save = 1

" Hardtime
let g:hardtime_default_on = 1
