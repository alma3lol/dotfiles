local M = {
	setup = require('alma3lol.plugins.prettier.setup'),
	bindings = require('alma3lol.plugins.prettier.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
