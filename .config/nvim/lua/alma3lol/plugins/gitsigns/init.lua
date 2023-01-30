local M = {
	setup = require('alma3lol.plugins.gitsigns.setup'),
	bindings = require('alma3lol.plugins.gitsigns.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
