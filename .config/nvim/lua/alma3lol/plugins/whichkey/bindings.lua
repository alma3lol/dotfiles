return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>", ":WhichKey '<Space>'<CR>")
	vim.g.alma3lol.bindings.vnoremap("<leader>", ":<c-u> :WhichKeyVisual '<Space>'<CR>")
end
