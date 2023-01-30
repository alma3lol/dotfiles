return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>uh", "<cmd>SignifyHunkUndo<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>gj", "<plug>(signify-next-hunk)")
	vim.g.alma3lol.bindings.nnoremap("<leader>gk", "<plug>(signify-prev-hunk)")
	vim.g.alma3lol.bindings.nnoremap("<leader>gJ", "9999<leader>gj")
	vim.g.alma3lol.bindings.nnoremap("<leader>gK", "9999<leader>gk")
end
