local M = {
	setup = require('alma3lol.plugins.legendary.setup'),
	bindings = require('alma3lol.plugins.legendary.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
