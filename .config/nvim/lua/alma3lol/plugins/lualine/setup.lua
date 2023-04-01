local fg = '#C9CCCD'
-- local bg = '#082F3B'

local colors = {
	color0 = '#D0D6B5',
	color1 = '#172030',
	color2 = '#FFAE8F',
	color3 = '#B87EA2',
	color4 = '#1E2A3E',
	color5 = '#4B2234',
	color6 = '#73A7A7',
}

return function()
	require('lualine').setup {
		options = {
			icons_enabled = true,
			component_separators = '',
			section_separators = '',
			theme = 'nord',
			-- theme = {
			-- 	normal = {
			-- 		a = { fg = colors.color1, bg = colors.color6, gui = 'bold', separator = colors.color0 },
			-- 		b = { fg = fg, bg = colors.color4 },
			-- 		c = { fg = fg, bg = colors.color4 },
			-- 		x = { fg = fg, bg = colors.color4 },
			-- 		y = { fg = fg, bg = colors.color4 },
			-- 		z = { fg = colors.color1, bg = colors.color6 },
			-- 	},
			-- 	insert = {
			-- 		a = { fg = colors.color1, bg = colors.color0, gui = 'bold', separator = colors.color0 },
			-- 	},
			-- 	visual = {
			-- 		a = { fg = colors.color1, bg = colors.color2, gui = 'bold', separator = colors.color0 },
			-- 	},
			-- 	command = {
			-- 		a = { fg = colors.color1, bg = colors.color3, gui = 'bold', separator = colors.color0 },
			-- 	},
			-- 	replace = {
			-- 		a = { fg = colors.color2, bg = colors.color5, gui = 'bold', separator = colors.color0 },
			-- 	},
			-- 	inactive = {
			-- 		c = { fg = fg, bg = colors.color4 },
			-- 	}
			-- },
			disabled_filetypes = {}
		},
		sections = {
			lualine_a = {
				{ 'mode', padding = 1 },
			},
			lualine_b = {
				-- 'branch',
				-- 'diff',
				-- 'diagnostics'
			},
			lualine_c = {
				'filename',
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
				-- { 'lsp_client_names()', icon = '', color = { fg = '#e0af68', gui = 'bold' }, },
				-- "require'lsp-status'.status()",
				-- { "require('package-info').get_status()", color = { gui = 'bold' },
				-- 	cond = function() return require('package-info').get_status() == '' end },
				-- { "require('nvim-gps').get_location()", cond = function() return require('nvim-gps').is_available() end },
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
end
