local M = {
	setup = function()
		require('alma3lol.plugins.neodev.setup')
	end,
}

M.init = function()
	M.setup()
end

return M
