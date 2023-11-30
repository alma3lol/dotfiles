local home = vim.fn.expand("$HOME")
require('linear').setup({
	api_key_cmd = 'gpg -d ' .. home .. '/linear-api-key.txt.gpg',
})
