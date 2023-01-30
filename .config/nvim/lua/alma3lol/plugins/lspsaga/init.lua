local M = {
	setup = require('alma3lol.plugins.lspsaga.setup'),
	bindings = require('alma3lol.plugins.lspsaga.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
