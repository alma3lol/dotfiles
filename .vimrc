syntax enable
set termguicolors
set number
set relativenumber
set autoread
au FocusGained,BufEnter * :silent! !
set encoding=utf-8
set visualbell
set backspace=indent,eol,start
set nobackup
set noswapfile
set scrolloff=8
set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 
set autoindent
set smartindent
set showmode showcmd
set ttyfast lazyredraw
set showmatch
set hlsearch incsearch ignorecase smartcase
set hidden
set wildmenu wildmode=list:longest,full
set laststatus=2 statusline=%F
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1
set colorcolumn=80

let g:netrw_browse_split = 3

call plug#begin('~/.local/share/vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'APZelos/blamer.nvim'
Plug 'fenetikm/falcon'
Plug 'ray-x/aurora'
call plug#end()

colorscheme aurora

let g:lightline = {
	      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
	      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ]
      \ }
      \ }

let g:blamer_enabled = 1
let g:blamer_date_format = '%e %b %Y'
highlight Blamer guifg=darkorange
