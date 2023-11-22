local M = {
	setup = function()
		require('alma3lol.plugins.luasnip.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.luasnip.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
