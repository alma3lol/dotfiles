local M = {
	setup = function()
		require('alma3lol.plugins.codecompanion.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.codecompanion.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
