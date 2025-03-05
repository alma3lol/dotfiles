vim.treesitter.language.register('markdown', 'vimwiki')
require('render-markdown').setup({
	file_types = { 'markdown', 'vimwiki', 'codecompanion' },
	-- Workaround for highlight issue related to breakindent.
	-- See: https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/149
	win_options = { breakindent = { default = true, rendered = false } },
	heading = {
		width = "block",
		right_pad = 1,
	},
})
