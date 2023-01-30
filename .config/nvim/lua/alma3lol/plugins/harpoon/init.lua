local M = {
	setup = require('alma3lol.plugins.harpoon.setup'),
	bindings = require('alma3lol.plugins.harpoon.bindings'),
}

M.init = function()
	M.setup()
	M.bindings()
end

return M
