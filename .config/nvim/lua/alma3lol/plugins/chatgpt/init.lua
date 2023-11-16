local M = {
	setup = function()
		require('alma3lol.plugins.chatgpt.setup')
	end,
	bindings = function()
		require('alma3lol.plugins.chatgpt.bindings')
	end
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
