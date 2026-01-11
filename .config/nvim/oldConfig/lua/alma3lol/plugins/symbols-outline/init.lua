local M = {
	setup = require('alma3lol.plugins.symbols-outline.setup'),
	bindings = require('alma3lol.plugins.symbols-outline.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
