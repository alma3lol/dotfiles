local M = {
	bindings = require('alma3lol.plugins.fugitive.bindings'),
}

M.init = function()
	M.bindings()
end

return M
