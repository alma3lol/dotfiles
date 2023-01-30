local M = {
	setup = require('alma3lol.plugins.bufferline.setup'),
	bindings = require('alma3lol.plugins.bufferline.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
