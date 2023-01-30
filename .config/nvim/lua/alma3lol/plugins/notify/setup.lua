return function()
	local notify = require("notify")
	notify.setup({
		background_colour = "#000000", -- NOTE: DO NOT REMOVE
	})
	vim.notify = notify
end
