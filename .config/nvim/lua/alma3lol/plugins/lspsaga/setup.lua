require('lspsaga').setup({
	symbol_in_winbar = {
		enable = false,
	},
	code_action_keys = { quit = '<ESC>', exec = '<CR>' },
	finder_action_keys = {
		open = '<CR>', vsplit = 'v', split = 's', quit = '<ESC>', scroll_down = '<C-f>', scroll_up = '<C-b>'
	},
	border_style = "round"
})

vim.cmd [[ highlight link LspSagaFinderSelection Search ]]
