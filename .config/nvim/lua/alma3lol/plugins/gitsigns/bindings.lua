return function()
	vim.g.alma3lol.bindings.nnoremap('[h', "<cmd>lua require('gitsigns').next_hunk()<CR>")
	vim.g.alma3lol.bindings.nnoremap(']h', "<cmd>lua require('gitsigns').prev_hunk()<CR>")
end
