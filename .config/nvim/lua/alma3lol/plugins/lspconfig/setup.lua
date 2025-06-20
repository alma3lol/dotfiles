local nvim_lsp = require "lspconfig"
local lsp_status = require "lsp-status"
local protocol = require "vim.lsp.protocol"
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)
lsp_status.register_progress()
lsp_status.config({
	current_function = false,
	show_filename = false,
	diagnostics = true,
	status_symbol = '✓',
})

local on_attach = function(client)
	if client:supports_method('textDocument/publishDiagnostic') then
		local is_pull = false -- true for `textDocument/diagnostic`
		local ns = vim.lsp.diagnostic.get_namespace(client.id, is_pull)

		vim.diagnostic.config({
			update_in_insert = true,
			underline = true,
			virtual_text = {
				spacing = 2,
				prefix = ' '
			},
			signs = true,
		}, ns)
	end
	lsp_status.on_attach(client)
	if client.server_capabilities.document_symbol then
		vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
		vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
		vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
	end
	require "lsp-format".on_attach(client)
	protocol.CompletionItemKind = {
		'', -- Text
		'', -- Method
		'', -- Function
		'', -- Constructor
		'', -- Field
		'', -- Variable
		'', -- Class
		'ﰮ', -- Interface
		'', -- Module
		'', -- Property
		'', -- Unit
		'', -- Value
		'', -- Enum
		'', -- Keyword
		'﬌', -- Snippet
		'', -- Color
		'', -- File
		'', -- Reference
		'', -- Folder
		'', -- EnumMember
		'', -- Constant
		'', -- Struct
		'', -- Event
		'ﬦ', -- Operator
		'', -- TypeParameter
	}
end

nvim_lsp.ts_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.pyright.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.elixirls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	-- cmd = { vim.env.HOME .. "/.local/share/nvim/mason/bin/elixir-ls" },
	settings = {
		elixirLS = {
			fetchDeps = false,
		}
	}
}

-- local lua_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/lua-language-server")

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.lua_ls.setup {
	-- cmd = { lua_bin },
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
			},
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
				},
				maxPreload = 2000,
				checkThirdParty = false,
			},
			telemetry = {
				enable = false
			}
		}
	}
}

nvim_lsp.jsonls.setup {
	-- cmd = { "vscode-json-languageserver", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { "typescript.json", "typescriptreact.json" },
					url =
					"https://raw.githubusercontent.com/Yash-Singh1/vscode-snippets-json-schema/main/schema.json"
				},
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json"
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json"
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json"
					},
					url = "https://json.schemastore.org/prettierrc.json"
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json"
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json"
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json"
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json"
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json"
					},
					url = "http://json.schemastore.org/stylelintrc.json"
				}
			}
		}
	}
}

nvim_lsp.solidity_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.prismals.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.tailwindcss.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.terraform_lsp.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
