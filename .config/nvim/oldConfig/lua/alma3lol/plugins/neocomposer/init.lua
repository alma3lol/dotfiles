local M = {
	setup = function()
		require('alma3lol.plugins.neocomposer.setup')
	end,
}

M.init = function()
	M.setup()
end

return M
