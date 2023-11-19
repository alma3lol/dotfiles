local home = vim.fn.expand("$HOME")
require("gp").setup({
	openai_api_key = vim.fn.systemlist { "gpg", "--decrypt", home .. "/chat-gpt-api-key.txt.gpg" }[3],
	chat_model = { model = 'gpt-3.5-turbo' }
})
