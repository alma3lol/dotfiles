local M = {
	setup = require('alma3lol.builtins.buffers.setup'),
	bindings = require('alma3lol.builtins.buffers.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M;
