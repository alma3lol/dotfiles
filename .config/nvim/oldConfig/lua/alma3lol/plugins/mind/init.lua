local M = {
	setup = require('alma3lol.plugins.mind.setup'),
	bindings = require('alma3lol.plugins.mind.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
