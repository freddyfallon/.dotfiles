" General Vim config
set shiftwidth=2
set softtabstop=2
set number

syntax on
colorscheme cosme

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --hidden --ignore-dir .git --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Ale config
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = ['eslint', 'prettier']
let g:ale_fix_on_save = 1

" Hardtime
let g:hardtime_default_on = 1

" vim-plug settings
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'takac/vim-hardtime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
call plug#end()
