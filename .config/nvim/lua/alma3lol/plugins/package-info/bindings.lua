return function()
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>ns :lua require('package-info').show()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>nh :lua require('package-info').hide()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>nu :lua require('package-info').update()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>nd :lua require('package-info').delete()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>ni :lua require('package-info').install()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>nr :lua require('package-info').reinstall()<CR>")
	vim.g.alma3lol.bindings.nnoremap("<silent>", "<leader>np :lua require('package-info').change_version()<CR>")
end
