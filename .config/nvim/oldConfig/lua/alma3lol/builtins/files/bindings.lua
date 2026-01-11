return function()
	vim.g.alma3lol.bindings.nnoremap("<C-k>s", "<cmd>wa<CR>")
	vim.g.alma3lol.bindings.nnoremap("<leader>of", function()
		local file = vim.fn.expand("<cfile>")
		vim.cmd("e " .. file)
	end)
	vim.g.alma3lol.bindings.nnoremap("<leader>fip", vim.g.alma3lol.functions.FindInProjectQuickFixList)
	vim.g.alma3lol.bindings.nnoremap("<leader>ct", vim.g.alma3lol.functions.GenerateCTagsForCurrentFile)
end
