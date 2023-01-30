local M = {
	setup = require('alma3lol.plugins.zenmode.setup'),
	bindings = require('alma3lol.plugins.zenmode.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
