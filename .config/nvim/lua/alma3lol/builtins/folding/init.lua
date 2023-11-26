local M = {
	bindings = function ()
		require('alma3lol.builtins.folding.bindings')
	end
}

M.init = function()
	M.bindings()
end

return M
