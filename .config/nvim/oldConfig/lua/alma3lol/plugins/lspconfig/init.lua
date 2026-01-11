local M = {
	setup = function()
		require('alma3lol.plugins.lspconfig.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.lspconfig.bindings')
	end,
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
