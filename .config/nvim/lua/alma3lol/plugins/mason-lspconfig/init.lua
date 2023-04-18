local M = {
	setup = function()
		require('alma3lol.plugins.mason-lspconfig.setup')
	end,
}

M.init = function()
	M.setup()
end

return M
