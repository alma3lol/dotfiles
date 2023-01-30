return function()
	local types = require("luasnip.util.types")

	local luasnip = require('luasnip')
	luasnip.config.setup({
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "●", "DiagnosticHint" } },
					priority = 0
				},
			},
		},
	})

	_G.expand_or_jump = function()
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		end
	end

	_G.jump_previous = function()
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		end
	end

	_G.change_choice = function()
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		end
	end

	-- require("luasnip.loaders.from_vscode").load({ paths = { vim.env.CWD .. "/vsnip",
	--     vim.env.CWD .. "/plugged/friendly-snippets" } })
	require("luasnip.loaders.from_lua").load({ paths = vim.fn.expand('<sfile>:p:h') .. "/snips" })
end
