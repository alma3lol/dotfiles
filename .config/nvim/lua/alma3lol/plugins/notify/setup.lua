return function()
	local notify = require("notify")
	notify.setup({
		-- background_colour = "#000000", -- NOTE: DO NOT REMOVE
		stages = "slide",
	})
	vim.notify = notify
end
