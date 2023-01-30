local M = {
	bindings = require('alma3lol.plugins.spectre.bindings'),
}

M.init = function()
	M.bindings()
end

return M
