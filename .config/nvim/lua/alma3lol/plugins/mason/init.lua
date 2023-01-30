local M = {
	setup = require('alma3lol.plugins.mason.setup'),
	bindings = require('alma3lol.plugins.mason.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
