return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>rr", "<cmd>SnipRun<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>vdw",
		"<cmd>vs<CR><cmd>lua vim.lsp.buf.definition()<CR><cmd>sleep 100ms<CR><cmd>wincmd h<CR>")
	vim.g.alma3lol.bindings.vnoremap("<leader>rs", "<cmd>'<,'>SnipRun<CR>")
end
