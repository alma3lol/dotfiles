local M = {
	setup = require('alma3lol.plugins.custom-theme.setup'),
	bindings = require('alma3lol.plugins.custom-theme.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
