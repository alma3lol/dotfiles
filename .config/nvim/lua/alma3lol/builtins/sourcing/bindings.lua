return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>sf", "<cmd>lua vim.g.alma3lol.functions.SourceCurrentFile()<CR>")
	vim.g.alma3lol.bindings.nnoremap(',sbl', "<cmd>lua vim.g.alma3lol.plugins.bufferline.setup()<CR>")
	vim.g.alma3lol.bindings.nnoremap(',sll', "<cmd>lua vim.g.alma3lol.plugins.lualine.setup()<CR>")
	vim.g.alma3lol.bindings.nnoremap(',stt', "<cmd>lua vim.g.alma3lol.builtins.theming.setup()<CR>")
	vim.g.alma3lol.bindings.nnoremap(',sbb', "<cmd>lua vim.g.alma3lol.bindings()<CR>")
	vim.g.alma3lol.bindings.nnoremap(',sif', "<cmd>lua vim.g.alma3lol.init()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>sl", "<cmd>lua vim.g.alma3lol.functions.SourceCurrentLine()<CR>")
	vim.g.alma3lol.bindings.vnoremap("<leader>sl", "<cmd><C-w>lua vim.g.alma3lol.functions.SourceSelectedLines()<CR>")
end
