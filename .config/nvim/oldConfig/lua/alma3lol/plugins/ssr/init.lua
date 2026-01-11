local M = {
	bindings = require('alma3lol.plugins.ssr.bindings'),
}

M.init = function()
	M.bindings()
end

return M
