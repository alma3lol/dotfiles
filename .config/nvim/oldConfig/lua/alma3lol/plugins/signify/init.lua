local M = {
	setup = require('alma3lol.plugins.signify.setup'),
	bindings = require('alma3lol.plugins.signify.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
