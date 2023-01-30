return function()
	vim.g.alma3lol.bindings.nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
	vim.g.alma3lol.bindings.nnoremap("<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>")
	vim.g.alma3lol.bindings.nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
	vim.g.alma3lol.bindings.nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
	vim.g.alma3lol.bindings.nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")
end
