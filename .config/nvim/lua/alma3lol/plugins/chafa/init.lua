local M = {
	setup = require('alma3lol.plugins.chafa.setup'),
	bindings = require('alma3lol.plugins.chafa.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
