local M = {
	setup = require('alma3lol.plugins.twilight.setup'),
	bindings = require('alma3lol.plugins.twilight.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
