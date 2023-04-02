local M = {
	setup = function()
		require('alma3lol.plugins.lualine.setup')
	end
}

M.init = function()
	M.setup()
end

return M
