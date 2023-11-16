local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
	api_key_cmd = "gpg --decrypt " .. home .. "/chat-gpt-api-key.txt.gpg"
})
