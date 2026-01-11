local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip',                options = { use_show_condition = false } },
		{ name = 'neorg' },
		{ name = 'buffer' },
		{ name = 'render-markdown' },
	}),
	formatting = {
		expandable_indicator = true,
		fields = { 'abbr', 'kind', 'menu' },

		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			menu = ({
				buffer = "[BFR]",
				nvim_lsp = "[LSP]",
				luasnip = "[SNP]",
				nvim_lua = "[LUA]",
			}),
		}),
	}
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' }
	})
})
