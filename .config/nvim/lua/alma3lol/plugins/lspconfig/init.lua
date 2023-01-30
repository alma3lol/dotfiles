local M = {
	setup = require('alma3lol.plugins.lspconfig.setup'),
	bindings = require('alma3lol.plugins.lspconfig.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
