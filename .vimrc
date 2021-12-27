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

let mapleader=' '

nnoremap <leader>1 :bN
nnoremap <leader>2 :bn
nnoremap <leader>3 #
nnoremap <leader>4 $
nnoremap <leader>5 %
nnoremap <leader>6 ^
nnoremap <leader>7 &
nnoremap <leader>8 *
nnoremap <leader>9 (
nnoremap <leader>0 )

nnoremap <leader>bd :bd<CR>
nnoremap <leader>xbd :bd!<CR>
nnoremap <leader>bn :ene<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>xw :w!<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader><leader>q :q
nnoremap <leader><leader>s :so %

nnoremap <leader>c. ct.
nnoremap <leader>c, ct,
nnoremap <leader>c' ct'
nnoremap <leader>c" ct"
nnoremap <leader>c` ct`
nnoremap <leader>c9 ct(
nnoremap <leader>c0 ct)
nnoremap <leader>c[ ct[
nnoremap <leader>c] ct]
nnoremap <leader>c{ ct{
nnoremap <leader>c} ct}
nnoremap <leader>c; ct;
nnoremap <leader>c4 c$
nnoremap <leader>c5 ci%
nnoremap <leader>c6 c^
nnoremap <leader><leader>c' ci'
nnoremap <leader><leader>c" ci"
nnoremap <leader><leader>c` ci`
nnoremap <leader><leader>c9 ci(
nnoremap <leader><leader>c[ ci[
nnoremap <leader><leader>c{ ci{

nnoremap <leader>d. dt.
nnoremap <leader>d, dt,
nnoremap <leader>d' dt'
nnoremap <leader>d" dt"
nnoremap <leader>d` dt`
nnoremap <leader>d9 dt(
nnoremap <leader>d0 dt)
nnoremap <leader>d[ dt[
nnoremap <leader>d] dt]
nnoremap <leader>d{ dt{
nnoremap <leader>d} dt}
nnoremap <leader>d; dt;
nnoremap <leader>d4 d$
nnoremap <leader>d5 di%
nnoremap <leader>d6 d^
nnoremap <leader><leader>d' di'
nnoremap <leader><leader>d" di"
nnoremap <leader><leader>d` di`
nnoremap <leader><leader>d9 di(
nnoremap <leader><leader>d[ di[
nnoremap <leader><leader>d{ di{

nnoremap <leader>y. yt.
nnoremap <leader>y, yt,
nnoremap <leader>y' yt'
nnoremap <leader>y" yt"
nnoremap <leader>y` yt`
nnoremap <leader>y9 yt(
nnoremap <leader>y0 yt)
nnoremap <leader>y[ yt[
nnoremap <leader>y] yt]
nnoremap <leader>y{ yt{
nnoremap <leader>y} yt}
nnoremap <leader>y; yt;
nnoremap <leader>y4 y$
nnoremap <leader>y5 yi%
nnoremap <leader>y6 y^
nnoremap <leader><leader>y' yi'
nnoremap <leader><leader>y" yi"
nnoremap <leader><leader>y` yi`
nnoremap <leader><leader>y9 yi(
nnoremap <leader><leader>y[ yi[
nnoremap <leader><leader>y{ yi{
