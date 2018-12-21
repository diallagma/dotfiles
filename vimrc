set nocompatible

" plug
filetype off
call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'micha/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

" ag
let g:ackprg = 'ag --nogroup --column'

" ctrl-p
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|coverage\|build\|git|'

" netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.graphql,*.vue PrettierAsync

" vim-fugitive
nmap <leader>gb :Gblame<CR>

" vim-polyglot
let g:javascript_plugin_flow = 1

" general
syntax enable
set background=dark
colorscheme nord
hi Visual term=reverse cterm=reverse guibg=Grey

set clipboard=unnamed
set esckeys
set expandtab
set hlsearch
set ignorecase
set incsearch
set number
set relativenumber
set shiftwidth=2
set smartcase
set timeout timeoutlen=5000 ttimeoutlen=100
set tabstop=2
set wildmenu

"shortcuts
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <silent> <C-i> :<C-u>nohlsearch<CR><C-l>
inoremap jj <Esc>
nmap <leader>l :set list!<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
nmap <leader>e :Explore<CR>
nmap <leader>se :split .<CR>
nmap <leader>ve :vsplit .<CR>
nmap <leader>te :tabe .<CR>

" source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
