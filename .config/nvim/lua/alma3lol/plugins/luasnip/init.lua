local M = {
	setup = require('alma3lol.plugins.luasnip.setup'),
	bindings = require('alma3lol.plugins.luasnip.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
