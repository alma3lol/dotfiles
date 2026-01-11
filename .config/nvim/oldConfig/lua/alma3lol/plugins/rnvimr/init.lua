local M = {
	bindings = require('alma3lol.plugins.rnvimr.bindings'),
}

M.init = function()
	M.bindings()
end

return M
