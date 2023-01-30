return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>qk", "<cmd>lprevious<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>qj", "<cmd>lnext<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>qp", "<cmd>cprevious<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>qn", "<cmd>cnext<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>qq", "<cmd>lua vim.g.alma3lol.functions.QuickFixToggle()<CR>")
end
