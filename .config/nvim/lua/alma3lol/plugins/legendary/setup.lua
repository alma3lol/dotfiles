return function()
	require('legendary').setup({
		keymaps = {},
		commands = {
			{
				itemgroup = "Current Buffer",
				commands = {
					{
						':SearchCBD', function()
							require('telescope.builtin').find_files({ path = require('telescope.utils').buffer_dir() })
						end, description = 'Search current buffer\'s directory'
					},
					{
						':GrepCBD', function()
							require('telescope.builtin').live_grep({ path = require('telescope.utils').buffer_dir() })
						end, description = 'Live grep current buffer\'s directory'
					},
				}
			},
			{
				itemgroup = 'Sudo Files',
				commands = {
					{
						':ReadSudoFile', function()
							local file = vim.fn.input('Sudo File > ')
							vim.cmd("SudaRead " .. file)
						end, description = 'Read a file owned by root'
					},
					{
						':WriteSudoFile', function()
							vim.cmd("SudaWrite")
						end, description = 'Write currently opened sudo file'
					},
				},
			},
			{
				itemgroup = 'Sourcing',
				commands = {
					{
						':SourceBindings', function()
							vim.g.alma3lol.bindings.setup()
						end, description = 'Source bindings\' files'
					},
					{
						':SourceTheme', function()
							vim.g.alma3lol.builtins.theming.setup()
						end, description = 'Source theme\'s file'
					},
					{
						':SourceBufferline', function()
							vim.g.alma3lol.plugins.bufferline.setup()
						end, description = 'Source bufferline\'s file'
					},
					{
						':SourceLualine', function()
							vim.g.alma3lol.plugins.lualine.setup()
						end, description = 'Source lualine\'s file'
					},
				}
			},
		},
		funcs = {},
		autocmds = {},
	});
end
