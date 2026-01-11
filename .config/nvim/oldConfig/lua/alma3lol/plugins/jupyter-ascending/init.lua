local M = {
	bindings = require('alma3lol.plugins.jupyter-ascending.bindings'),
}

M.init = function()
	M.bindings()
end

return M
