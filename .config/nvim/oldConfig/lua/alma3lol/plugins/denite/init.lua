local M = {
	setup = require('alma3lol.plugins.denite.setup'),
	bindings = require('alma3lol.plugins.denite.bindings')
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
