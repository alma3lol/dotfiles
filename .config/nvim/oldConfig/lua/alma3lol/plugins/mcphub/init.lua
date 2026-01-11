local M = {
	setup = function()
		require('alma3lol.plugins.mcphub.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.mcphub.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
