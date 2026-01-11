local M = {
	setup = require('alma3lol.plugins.sessionlens.setup'),
	bindings = require('alma3lol.plugins.sessionlens.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
