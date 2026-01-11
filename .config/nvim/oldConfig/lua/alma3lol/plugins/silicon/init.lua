local M = {
	bindings = require('alma3lol.plugins.silicon.bindings'),
}

M.init = function()
	M.bindings()
end

return M
