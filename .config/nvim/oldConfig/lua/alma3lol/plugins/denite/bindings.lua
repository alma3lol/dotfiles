return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>db", ":Denite -auto-resize buffer<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>dh", ":Denite -auto-resize help<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>dm", ":Denite -auto-resize mark<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>do", ":Denite -auto-resize outline<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>dr", ":Denite -auto-resize register<CR>")
end
