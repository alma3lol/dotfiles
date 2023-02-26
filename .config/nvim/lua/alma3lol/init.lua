vim.env.CWD = vim.fn.expand("<sfile>:p:h")

vim.g.alma3lol = {
	init = function()
		vim.g.alma3lol.config()
		vim.g.alma3lol.packer.setup()
		for _, b in pairs(vim.g.alma3lol.builtins) do
			for k, f in pairs(b) do
				if k == "init" then f() end
			end
		end
		for _, p in pairs(vim.g.alma3lol.plugins) do
			for k, f in pairs(p) do
				if k == "init" then f() end
			end
		end
	end,
	setup = function()
		for _, b in pairs(vim.g.alma3lol.builtins) do
			for k, f in pairs(b) do
				if k == "setup" then f() end
			end
		end
		for _, p in pairs(vim.g.alma3lol.plugins) do
			for k, f in pairs(p) do
				if k == "setup" then f() end
			end
		end
	end,
	bindings = require("alma3lol.bindings"),
	functions = require("alma3lol.functions"),
	config = require("alma3lol.config"),
	packer = require("alma3lol.packer"),
	builtins = {
		buffers = require("alma3lol.builtins.buffers"),
		files = require("alma3lol.builtins.files"),
		folding = require("alma3lol.builtins.folding"),
		lsp = require("alma3lol.builtins.lsp"),
		movement = require("alma3lol.builtins.movement"),
		quickfixlist = require("alma3lol.builtins.quickfixlist"),
		sourcing = require("alma3lol.builtins.sourcing"),
		tabs = require("alma3lol.builtins.tabs"),
		theming = require("alma3lol.builtins.theming"),
		windows = require("alma3lol.builtins.windows"),
	},
	plugins = {
		alternate = require("alma3lol.plugins.alternate"),
		autosession = require("alma3lol.plugins.autosession"),
		bufferline = require("alma3lol.plugins.bufferline"),
		chafa = require("alma3lol.plugins.chafa"),
		colorizer = require("alma3lol.plugins.colorizer"),
		comment = require("alma3lol.plugins.comment"),
		compe = require("alma3lol.plugins.compe"),
		custom_theme = require("alma3lol.plugins.custom-theme"),
		dap = require("alma3lol.plugins.dap"),
		dap_ui = require("alma3lol.plugins.dap-ui"),
		dap_virtual_text = require("alma3lol.plugins.dap-virtual-text"),
		denite = require("alma3lol.plugins.denite"),
		emmet = require("alma3lol.plugins.emmet"),
		flashcards = require("alma3lol.plugins.flashcards"),
		floaterm = require("alma3lol.plugins.floaterm"),
		fugitive = require("alma3lol.plugins.fugitive"),
		gitsigns = require("alma3lol.plugins.gitsigns"),
		gomove = require("alma3lol.plugins.gomove"),
		gps = require("alma3lol.plugins.gps"),
		harpoon = require("alma3lol.plugins.harpoon"),
		indent_blankline = require("alma3lol.plugins.indent-blankline"),
		jqxlist = require("alma3lol.plugins.jqxlist"),
		jupyter_ascending = require("alma3lol.plugins.jupyter-ascending"),
		keymenu = require("alma3lol.plugins.keymenu"),
		lazygit = require("alma3lol.plugins.lazygit"),
		legendary = require("alma3lol.plugins.legendary"),
		lsp_format = require("alma3lol.plugins.lsp-format"),
		lsp_installer = require("alma3lol.plugins.lsp-installer"),
		lspconfig = require("alma3lol.plugins.lspconfig"),
		lspsaga = require("alma3lol.plugins.lspsaga"),
		lualine = require("alma3lol.plugins.lualine"),
		luasnip = require("alma3lol.plugins.luasnip"),
		mason = require("alma3lol.plugins.mason"),
		mason_lspconfig = require("alma3lol.plugins.mason-lspconfig"),
		maximizer = require("alma3lol.plugins.maximizer"),
		mind = require("alma3lol.plugins.mind"),
		neo_minimap = require("alma3lol.plugins.neo-minimap"),
		neoclip = require("alma3lol.plugins.neoclip"),
		nerdtree = require("alma3lol.plugins.nerdtree"),
		notify = require("alma3lol.plugins.notify"),
		octo = require("alma3lol.plugins.octo"),
		onedarkpro = require("alma3lol.plugins.onedarkpro"),
		package_info = require("alma3lol.plugins.package-info"),
		prettier = require("alma3lol.plugins.prettier"),
		renamestate = require("alma3lol.plugins.renamestate"),
		rnvimr = require("alma3lol.plugins.rnvimr"),
		runinblender = require("alma3lol.plugins.runinblender"),
		sessionlens = require("alma3lol.plugins.sessionlens"),
		sideways = require("alma3lol.plugins.sideways"),
		signify = require("alma3lol.plugins.signify"),
		silicon = require("alma3lol.plugins.silicon"),
		sj = require("alma3lol.plugins.sj"),
		sneak = require("alma3lol.plugins.sneak"),
		snippetgenie = require("alma3lol.plugins.snippetgenie"),
		spectre = require("alma3lol.plugins.spectre"),
		ssr = require("alma3lol.plugins.ssr"),
		substitute = require("alma3lol.plugins.substitute"),
		surround = require("alma3lol.plugins.surround"),
		symbols_outline = require("alma3lol.plugins.symbols-outline"),
		tagbar = require("alma3lol.plugins.tagbar"),
		telescope = require("alma3lol.plugins.telescope"),
		terminal = require("alma3lol.plugins.terminal"),
		todo_comments = require("alma3lol.plugins.todo-comments"),
		toggleterm = require("alma3lol.plugins.toggleterm"),
		transparent = require("alma3lol.plugins.transparent"),
		treesitter = require("alma3lol.plugins.treesitter"),
		treesitter_context = require("alma3lol.plugins.treesitter-context"),
		trouble = require("alma3lol.plugins.trouble"),
		twilight = require("alma3lol.plugins.twilight"),
		undotree = require("alma3lol.plugins.undotree"),
		workspaces = require("alma3lol.plugins.workspaces"),
	},
}

vim.g.alma3lol.bindings.setup = function()
	for _, b in pairs(vim.g.alma3lol.builtins) do
		for k, f in pairs(b) do
			if k == "bindings" then f() end
		end
	end
	for _, p in pairs(vim.g.alma3lol.plugins) do
		for k, f in pairs(p) do
			if k == "bindings" then f() end
		end
	end
end
