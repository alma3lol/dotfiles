local M = {
	setup = function()
		require('alma3lol.plugins.nvim-surround.setup')
	end
}

M.init = function()
	M.setup()
end

return M
