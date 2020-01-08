set nocompatible

" plug
filetype off
call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkarter/bullets.vim'
Plug 'mileszs/ack.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ianks/vim-tsx'
call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

" ag
let g:ackprg = 'ag --nogroup --column'

" ctrl-p
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_silent = 1

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#config_precedence = 'prefer-file'

"tmux-navigator"
set mouse=a

" view
syntax enable
set background=dark
colorscheme nord
hi Visual term=reverse cterm=reverse guibg=Grey
highlight CursorLineNr cterm=NONE

" config
set clipboard=unnamed
set expandtab
set hidden
set history=200
set hlsearch
set laststatus=2
set ignorecase
set incsearch
set number
set relativenumber
set ruler
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set timeout timeoutlen=5000 ttimeoutlen=100
set tabstop=2
set wildmenu

" spellcheck
autocmd FileType gitcommit setlocal spell

" markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md setlocal spell

" swap files
set swapfile
set dir^=~/.vim/swap//

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

" tags
set tags=tags;/

"shortcuts
nnoremap <silent> <C-i> :<C-u>nohlsearch<CR><C-l>
inoremap jj <Esc>
nmap <leader>l :set list!<CR>
nmap <leader>e :Explore<CR>
nmap <leader>\ :Explore<CR>
nmap <leader>se :split .<CR>
nmap <leader>ve :vsplit .<CR>
nmap <leader>te :tabe .<CR>
