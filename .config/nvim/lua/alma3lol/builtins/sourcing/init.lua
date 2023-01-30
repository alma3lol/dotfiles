local M = {
	bindings = require('alma3lol.builtins.sourcing.bindings'),
}

M.init = function()
	M.bindings()
end

return M
