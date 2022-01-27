call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'dyng/ctrlsf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'arcticicestudio/nord-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()

colorscheme nord

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
set mouse=a
set splitbelow
set splitright

let mapleader = ","

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :vsp $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Move to start of first non-whitespace character
nmap <leader>0 ^

" Copy entire buffer into system clipboard
nmap <leader>co gg"*yG

" Copy selected text in visual mode into system clipboard
nmap <leader>cc "*y

" Past from system clipboard
nmap <leader>pp "*p

" Get vertical git diff for merge conflicts
nmap <leader>d :Gvdiffsplit!<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Quick exit from insert mode
imap jk <esc>
imap kj <esc>

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" VimTest remappings
nmap <leader>tt :TestFile<cr>
nmap <leader>ty :TestSuite<cr>

" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --hidden --ignore-dir .git  --ignore-dir node_modules --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Ctrl-SF
nmap <c-f> <Plug>CtrlSFPrompt

" Airline
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
set laststatus=2 " for airline


" Check if vim-plug is installed and if not, install it!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Check if the_silver_searcher is installed and if not, install it!
if empty(glob('/usr/local/Cellar/the_silver_searcher'))
  silent !brew install the_silver_searcher
endif

" ============ CoC config ============
"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-emmet',
  \ 'coc-tailwindcss',
  \ 'coc-python'
  \ ]
" ============ End of CoC config ============
