local M = {
	setup = require('alma3lol.plugins.treesitter.setup'),
	bindings = require('alma3lol.plugins.treesitter.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
