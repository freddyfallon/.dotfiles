" General Vim config
set shiftwidth=2
set softtabstop=2
set number

set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set incsearch
set autowrite

syntax on
colorscheme cosme

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

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

" Airline
let g:airline_left_sep = ' ★  '
let g:airline_theme = 'dracula'
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
set laststatus=2 " for airline

" vim-plug settings
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'takac/vim-hardtime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
