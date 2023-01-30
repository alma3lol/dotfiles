return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>so", "<cmd>lua require('spectre').open()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>sc", "<cmd>lua require('spectre').open_file_search()<CR>")
	vim.g.alma3lol.bindings.vnoremap("<leader>ss", "<cmd>lua require('spectre').open_visual()<CR>")
end
