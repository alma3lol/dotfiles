local theme = require('lush_theme.my_theme.lualine_theme')

require('lualine').setup {
	options = {
		icons_enabled = true,
		component_separators = '',
		section_separators = '',
		theme = theme,
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {
			{ 'mode', padding = 1 },
		},
		lualine_b = {},
		lualine_c = {
			'filename',
			"require('NeoComposer.ui').status_recording()",
			{
				function()
					local search = vim.fn.searchcount({ maxcount = 0 }) -- maxcount = 0 makes the number not be capped at 99
					local searchCurrent = search.current
					local searchTotal = search.total
					if searchCurrent > 0 then
						return "(" .. vim.fn.getreg("/") .. ") [" .. searchCurrent .. "/" .. searchTotal .. "]"
					else
						return ""
					end
				end,
				icon = ''
			},
		},
		lualine_x = {
			{ "vim.g.alma3lol.functions.lsp_client_names()", icon = '', color = { fg = '#e0af68', gui = 'bold' }, },
			"require'lsp-status'.status()",
			{
				"require('package-info').get_status()",
				color = { gui = 'bold' },
				cond = function() return require('package-info').get_status() == '' end
			},
			-- 'encoding',
			-- 'fileformat',
			-- 'filetype'
		},
		lualine_y = {
			'branch',
			"vim.g.alma3lol.functions.battery_status()",
			-- 'progress',
		},
		lualine_z = {
			{ 'progress', padding = 1 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
