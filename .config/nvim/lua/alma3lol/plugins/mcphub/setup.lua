require("mcphub").setup({
	port = 37373,
	config = vim.fn.expand("~/.config/mcp-hub.json"),
	native_servers = {},

	-- Extensions configuration
	extensions = {
		avante = {
			auto_approve_mcp_tool_calls = false,
		},
		codecompanion = {
			show_result_in_chat = false,
			make_vars = true,
		},
	},

	-- Default window settings
	ui = {
		window = {
			width = 0.8,
			height = 0.8,
			relative = "editor",
			zindex = 50,
			border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
		},
	},

	-- Event callbacks
	on_ready = function(hub)
		-- Called when hub is ready
	end,
	on_error = function(err)
		-- Called on errors
	end,

	use_bundled_binary = false,

	cmd = "mcp-hub",
	cmdArgs = {},
	log = {
		level = vim.log.levels.WARN,
		to_file = false,
		file_path = nil,
		prefix = "MCPHub"
	}
})
