return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>cja",
		"<cmd>lua require('alma3lol.functions').CreateJupyterAscendingNotebook()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>x", "<Plug>JupyterExecute")
	vim.g.alma3lol.bindings.nnoremap("<leader><leader>X", "<Plug>JupyterExecuteAll")
end
