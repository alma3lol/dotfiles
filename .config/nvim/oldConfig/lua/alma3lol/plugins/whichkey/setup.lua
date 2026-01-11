vim.g.which_key_map = {}
-- Define a separator
vim.g.which_key_sep = '→'

vim.cmd [[
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Register which key map
call which_key#register('<leader>', "g:which_key_map")
]]
