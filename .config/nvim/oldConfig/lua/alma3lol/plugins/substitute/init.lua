local M = {
	setup = require('alma3lol.plugins.substitute.setup'),
	bindings = require('alma3lol.plugins.substitute.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
