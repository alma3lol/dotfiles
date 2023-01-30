local M = {
	setup = require('alma3lol.plugins.telescope.setup'),
	bindings = require('alma3lol.plugins.telescope.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
