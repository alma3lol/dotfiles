require('legendary').setup({
	keymaps = {},
	commands = {
		{
			itemgroup = "Useful Commands",
			commands = {
				{
					':UpdatePackages',
					function()
						vim.cmd(":PackerSync")
					end,
					description = 'Search current buffer\'s directory'
				},
			}
		},
		{
			itemgroup = "Current Buffer",
			commands = {
				{
					':SearchCBD',
					function()
						require('telescope.builtin').find_files({ path = require('telescope.utils').buffer_dir() })
					end,
					description = 'Search current buffer\'s directory'
				},
				{
					':GrepCBD',
					function()
						require('telescope.builtin').live_grep({ path = require('telescope.utils').buffer_dir() })
					end,
					description = 'Live grep current buffer\'s directory'
				},
				{
					':WriteWithoutAutocmd',
					function()
						vim.cmd(":noau w!")
					end,
					description = 'Writes the changes to the file without autocmds running'
				}
			}
		},
		{
			itemgroup = 'Sudo Files',
			commands = {
				{
					':ReadSudoFile',
					function()
						local file = vim.fn.input('Sudo File > ')
						vim.cmd("SudaRead " .. file)
					end,
					description = 'Read a file owned by root'
				},
				{
					':WriteSudoFile',
					function()
						vim.cmd("SudaWrite")
					end,
					description = 'Write currently opened sudo file'
				},
			},
		},
		{
			itemgroup = 'Sourcing',
			commands = {
				{
					':SourceBindings',
					function()
						vim.g.alma3lol.bindings.setup()
					end,
					description = 'Source bindings\' files'
				},
				{
					':SourceTheme',
					function()
						vim.g.alma3lol.builtins.theming.setup()
					end,
					description = 'Source theme\'s file'
				},
				{
					':SourceBufferline',
					function()
						vim.g.alma3lol.plugins.bufferline.setup()
					end,
					description = 'Source bufferline\'s file'
				},
				{
					':SourceLualine',
					function()
						vim.g.alma3lol.plugins.lualine.setup()
					end,
					description = 'Source lualine\'s file'
				},
			}
		},
		{
			itemgroup = 'Theme',
			commands = {
				{
					':Lushify',
					function()
						local file = vim.fn.expand('%')
						require('lush').ify(file)
					end,
					description = 'Lushify current file'
				}
			}
		},
		{
			itemgroup = "Treesitter",
			commands = {
				{
					':TSPlaygroundToggle',
					description = 'Toggle Treesitter\'s playground'
				},
				{
					':TSHighlightCapturesUnderCursor',
					description = 'Highlight captures under cursor'
				}
			}
		}
	},
	funcs = {},
	autocmds = {},
});
