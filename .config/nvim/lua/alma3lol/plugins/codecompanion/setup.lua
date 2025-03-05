require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "qwen",
		},
		inline = {
			adapter = "qwen",
		},
	},
	adapters = {
		qwen = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "qwen",
				schema = {
					model = {
						default = "qwen2.5-coder",
					},
					num_ctx = {
						default = 16384,
					},
					num_predict = {
						default = -1,
					},
				},
			})
		end,
	},
})

require('alma3lol.plugins.codecompanion.fidget-spinner'):init()
