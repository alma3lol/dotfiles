local home = vim.fn.expand("$HOME")

local file_exists = function(name)
	local f = io.open(name, "r")
	return f ~= nil and io.close(f)
end

local global_key = home .. '/linear-api-key.txt.gpg'
local project_key = vim.fn.getcwd() .. '/linear-api-key.txt.gpg'

require('linear').setup({
	api_key_cmd = 'gpg -d ' .. (file_exists(project_key) and project_key or global_key),
})
