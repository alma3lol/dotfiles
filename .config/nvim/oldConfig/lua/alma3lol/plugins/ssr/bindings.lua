return function()
	vim.g.alma3lol.bindings.nnoremap('<leader>sr', '<cmd>lua require("ssr").open()<CR>')
	vim.g.alma3lol.bindings.xnoremap('<leader>sr', '<cmd>lua require("ssr").open()<CR>')
end
