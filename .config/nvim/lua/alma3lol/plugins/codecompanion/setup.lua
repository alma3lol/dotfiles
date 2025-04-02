vim.g.codecompanion_auto_tool_mode = true
require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "deep_seek",
			tools = {
				["mcp"] = {
					-- calling it in a function would prevent mcphub from being loaded before it's needed
					callback = function() return require("mcphub.extensions.codecompanion") end,
					description = "Call tools and resources from the MCP Servers",
					opts = {
						requires_approval = true,
					}
				}
			}
		},
		inline = {
			adapter = "coder",
			tools = {
				["mcp"] = {
					-- calling it in a function would prevent mcphub from being loaded before it's needed
					callback = function() return require("mcphub.extensions.codecompanion") end,
					description = "Call tools and resources from the MCP Servers",
					opts = {
						requires_approval = true,
					}
				}
			}
		},
	},
	adapters = {
		deep_seek = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "deep_seek",
				schema = {
					model = {
						default = "deepseek-r1:8b",
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
		coder = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "coder",
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
