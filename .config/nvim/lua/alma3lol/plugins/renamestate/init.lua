local M = {
	setup = require('alma3lol.plugins.renamestate.setup'),
	bindings = require('alma3lol.plugins.renamestate.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
