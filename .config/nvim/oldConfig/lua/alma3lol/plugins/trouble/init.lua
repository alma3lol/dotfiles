local M = {
	setup = require('alma3lol.plugins.trouble.setup'),
	bindings = require('alma3lol.plugins.trouble.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
