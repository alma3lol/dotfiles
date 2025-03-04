local ts_utils = require('nvim-treesitter.ts_utils')

require('nvim-treesitter.configs').setup {
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = true,
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	ensure_installed = {
		'javascript',
		'tsx',
		'typescript',
		'regex',
		'python',
		'lua',
		'jsonc',
		'json',
		'jsdoc',
		'html',
		'css',
		'dockerfile',
		'heex',
		'elixir',
		'eex',
	},
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	modules = {},
	highlight = {
		enable = true,
		-- use_languagetree = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	textobjects = {
		enable = true,
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				-- [",df"] = "@function.outer",
				-- [",dc"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["[["] = "@function.outer",
				["[;"] = "@call.outer",
				["<leader>of"] = "@function.outer",
				["<leader>oc"] = "@conditional.outer",
				["<leader>if"] = "@function.inner",
				["<leader>ic"] = "@conditional.inner",
				["[a"] = "@function.args",
			},
			goto_next_end = {
				["[]"] = "@function.outer",
				["['"] = "@call.outer",
			},
			goto_previous_start = {
				["]]"] = "@function.outer",
				["];"] = "@call.outer",
				["<leader><leader>of"] = "@function.outer",
				["<leader><leader>oc"] = "@conditional.outer",
				["<leader><leader>if"] = "@function.inner",
				["<leader><leader>ic"] = "@conditional.inner",
				["]a"] = "@function.args",
			},
			goto_previous_end = {
				["]["] = "@function.outer",
				["]'"] = "@call.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			lookbehind = true,
			keymaps = {
				["of"] = "@function.outer",
				["if"] = "@function.inner",
				["oc"] = "@call.outer",
				["ic"] = "@call.inner",
				["oC"] = "@class.outer",
				["iC"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader><leader>a"] = "@parameter.inner",
			},
		},
	},
	textsubjects = {
		enable = true,
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
		}
	},
	indent = { enable = true },
	matchup = { enable = true },
	autopairs = { enable = true },
	rainbow = { enable = true, extended_mode = true },
	-- context_commentstring = { enable = true },
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" }
	},
	refactor = {
		highlight_definitaions = { enable = true },
		highlight_current_scope = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_previous_usage = "g1",
				goto_next_usage = "g2",
			},
		},
	}
}

require('ts_context_commentstring').setup {}

local get_root = function(bufnm)
	local parser = vim.treesitter.get_parser(bufnm, 'tsx', {})
	local tree = parser:parse()[1]
	return tree:root()
end

local get_parent_node_by_range = function(node, range)
	while node:parent() ~= nil do
		if (node:range() == range) then
			return node
		end
		node = node:parent()
	end
	return nil
end

local query = vim.treesitter.query.parse('tsx', [[
	(lexical_declaration (variable_declarator (identifier) @name))
]])

local InsertBeforeOrAfterComponentName = function(after)
	local current_buf = vim.api.nvim_get_current_buf()
	if vim.bo[current_buf].filetype ~= 'typescriptreact' then
		vim.notify('Not a typescriptreact file!')
		return
	end
	local root_node = get_root(current_buf)
	local current_node = ts_utils.get_node_at_cursor(vim.api.nvim_get_current_win(), true)
	for _, node in query:iter_captures(root_node, current_buf, 0, -1) do
		local found_node = get_parent_node_by_range(current_node, node:range())
		if (found_node ~= nil) then
			ts_utils.goto_node(node)
			if (after) then vim.cmd('norm el') end
			vim.cmd('startinsert')
			return
		end
	end
end

local ChangeComponentName = function()
	local current_buf = vim.api.nvim_get_current_buf()
	if vim.bo[current_buf].filetype ~= 'typescriptreact' then
		vim.notify('Not a typescriptreact file!')
		return
	end
	local root_node = get_root(current_buf)
	local current_node = ts_utils.get_node_at_cursor(vim.api.nvim_get_current_win(), true)
	for _, node in query:iter_captures(root_node, current_buf, 0, -1) do
		local found_node = get_parent_node_by_range(current_node, node:range())
		if (found_node ~= nil) then
			ts_utils.goto_node(node)
			vim.cmd('norm de')
			vim.cmd('startinsert')
			return
		end
	end
end

vim.api.nvim_create_user_command('InsertBeforeComponentName', function()
	InsertBeforeOrAfterComponentName()
end, {})

vim.api.nvim_create_user_command('InsertAfterComponentName', function()
	InsertBeforeOrAfterComponentName(true)
end, {})

vim.api.nvim_create_user_command('ChangeComponentName', function()
	ChangeComponentName()
end, {})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
