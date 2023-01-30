return function()
	vim.api.nvim_create_autocmd('BufWritePre', {
		command = 'Prettier'
	})
end
