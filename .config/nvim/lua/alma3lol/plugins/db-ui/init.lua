local M = {
	bindings = function()
		require('alma3lol.plugins.db-ui.bindings')
	end
}

M.init = function()
	M.bindings()
end

return M
