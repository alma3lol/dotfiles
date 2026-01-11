local M = {
	setup = function()
		require('alma3lol.plugins.symbol-usage.setup')
	end
}

M.init = function()
	M.setup()
end

return M;
