local M = {
	setup = require('alma3lol.plugins.package-info.setup'),
	bindings = require('alma3lol.plugins.package-info.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
