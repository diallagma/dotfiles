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
Plug 'tpope/vim-unimpaired'
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

" polyglot
let g:javascript_plugin_flow = 1

" prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.vue PrettierAsync

"tmux-navigator"
set mouse=a

" general
syntax enable
set background=dark
colorscheme nord
hi Visual term=reverse cterm=reverse guibg=Grey

set clipboard=unnamed
set expandtab
set hidden
set history=200
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

" language formatting
autocmd FileType java setlocal ts=4 sts=4 sw=4

" swap files
set swapfile
set directory^=~/.vim/swap//

" backups
set writebackup
set nobackup
set backupcopy=auto
if has("patch-8.1.0251")
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

"shortcuts
nmap <leader>vrc :tabedit $MYVIMRC<CR>
nnoremap <silent> <C-i> :<C-u>nohlsearch<CR><C-l>
inoremap jj <Esc>
nmap <leader>l :set list!<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
nmap <leader>e :Explore<CR>
nmap <leader>se :split .<CR>
nmap <leader>ve :vsplit .<CR>
nmap <leader>te :tabe .<CR>

map <leader>vp :VimuxPromptCommand<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

tnoremap <Esc> <C-\><C-n>
" source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
