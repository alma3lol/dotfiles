return function()
	vim.g.alma3lol.bindings.nnoremap('s', '<cmd>lua require("substitute").operator()<cr>')
	vim.g.alma3lol.bindings.nnoremap('ss', '<cmd>lua require("substitute").line()<cr>')
	vim.g.alma3lol.bindings.nnoremap('S', '<cmd>lua require("substitute").eol()<cr>')
	vim.g.alma3lol.bindings.nnoremap('<leader>s', '<cmd>lua require("substitute.range").operator()<cr>')
	vim.g.alma3lol.bindings.nnoremap('<leader>ss', '<cmd>lua require("substitute.range").word()<cr>')
	vim.g.alma3lol.bindings.nnoremap('sx', '<cmd>lua require("substitute.exchange").operator()<cr>')
	vim.g.alma3lol.bindings.nnoremap('sxx', '<cmd>lua require("substitute.exchange").line()<cr>')
	vim.g.alma3lol.bindings.nnoremap('sxc', '<cmd>lua require("substitute.exchange").cancel()<cr>')
	vim.g.alma3lol.bindings.xnoremap('s', '<cmd>lua require("substitute").visual()<cr>')
	vim.g.alma3lol.bindings.xnoremap('<leader>s', '<cmd>lua require("substitute.range").visual()<cr>')
	vim.g.alma3lol.bindings.xnoremap('X', '<cmd>lua require("substitute.exchange").visual()<cr>')
end
