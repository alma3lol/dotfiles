local M = {
	setup = require('alma3lol.plugins.dap.setup'),
	bindings = require('alma3lol.plugins.dap.bindings')
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
