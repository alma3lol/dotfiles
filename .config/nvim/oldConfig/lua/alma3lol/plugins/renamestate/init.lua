local M = {
	bindings = require('alma3lol.plugins.renamestate.bindings'),
}

M.init = function()
	M.bindings()
end

return M
