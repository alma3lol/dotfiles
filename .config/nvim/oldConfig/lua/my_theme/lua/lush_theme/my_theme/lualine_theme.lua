local theme = require('lush_theme.my_theme.init')

local fg = theme.Normal.fg.hex
local bg = "#000000"
local normal_mode = { fg = theme.Normal.fg.hex, bg = bg, gui = 'bold', separator = fg }
local insert_mode = { fg = theme.String.fg.hex, bg = bg, gui = 'bold', separator = fg }
local visual_mode = { fg = theme.Visual.bg.hex, bg = bg, gui = 'bold', separator = fg }
local command_mode = { fg = theme.Boolean.fg.hex, bg = bg, gui = 'bold', separator = fg }
local replace_mode = { fg = theme.Function.fg.hex, bg = bg, gui = 'bold', separator = fg }

return {
	normal = {
		a = normal_mode,
		b = { fg = fg, bg = bg },
		c = { fg = theme.NormalFloat.fg.hex, bg = bg },
		x = { fg = fg, bg = bg },
		y = { fg = fg, bg = bg },
		z = { fg = fg, bg = bg },
	},
	insert = {
		a = insert_mode,
	},
	visual = {
		a = visual_mode,
	},
	command = {
		a = command_mode,
	},
	replace = {
		a = replace_mode,
	},
	inactive = {}
}
