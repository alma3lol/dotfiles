local M = {
	bindings = require('alma3lol.builtins.lsp.bindings'),
}

M.init = function()
	M.bindings()
end

return M
