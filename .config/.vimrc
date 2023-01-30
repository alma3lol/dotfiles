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

nnoremap <leader>1 :bN<CR>
nnoremap <leader>2 :bn<CR>
nnoremap <leader>3 #
nnoremap <leader>4 $
nnoremap <leader>5 %
nnoremap <leader>6 ^
nnoremap <leader>7 &
nnoremap <leader>8 *
nnoremap <leader>9 (
nnoremap <leader>0 )

nnoremap <C-k>s :wa<CR>
nnoremap <C-k>w :bufdo bd<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>xbd :bd!<CR>
nnoremap <leader>bn :ene<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>xw :w!<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

nnoremap <leader><leader>of :e <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader><leader>q :q<CR>
nnoremap <leader><leader>s :so %<CR>
nnoremap <leader><leader>v V
nmap <C-/> vgc
nmap <leader>/ vgc

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

vmap <C-/> gc
vmap <leader>/ gc
vmap <leader>s' S'
vmap <leader>s" S"
vmap <leader>s` S`
vmap <leader>s{ S{
vmap <leader>s[ S[
vmap <leader>s9 S(
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <F2> <C-O>:set invpaste paste?<CR><CR>
inoremap <leader><leader><BS> <Esc>v0c
inoremap <leader><leader>o <Esc>o
inoremap <leader><leader>no <Esc>O
inoremap <leader><leader>p <Esc>pa
inoremap <c-j> <esc>:m .+1<CR>==a
inoremap <c-k> <esc>:m .-2<CR>==a
