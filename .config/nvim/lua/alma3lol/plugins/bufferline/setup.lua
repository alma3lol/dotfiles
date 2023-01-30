return function()
	local pickers = require('telescope.pickers')
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local groups = require('bufferline.groups')

	vim.api.nvim_create_user_command('TelescopeBufferLineToggleGroup', function()
		local groups_names = {}
		for i, group in pairs(groups.names()) do
			if group ~= 'ungrouped' then
				groups_names[i] = group
			end
		end
		pickers.new({}, {
			prompt_title = 'Toggle Bufferline Group',
			finder = finders.new_table({
				results = groups_names,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd('BufferLineGroupToggle ' .. selection[1])
				end)
				return true
			end,
		}):find()
	end, {})

	require('bufferline').setup {
		options = {
			numbers = function(opts)
				return string.format('%s·%s', opts.ordinal, opts.lower(opts.id))
			end,
			close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator = {
				style = 'icon',
				icon = '▎'
			},
			buffer_close_icon = '',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
				if buf.name:match('%.md') then
					return vim.fn.fnamemodify(buf.name, ':t:r')
				end
			end,
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 18,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " "
						or (e == "warning" and " " or "")
					s = s .. n .. sym
				end
				return s
			end,
			-- NOTE: this will be called a lot so don't do any heavy processing here
			custom_filter = function(buf_number)
				-- filter out filetypes you don't want to see
				if vim.bo[buf_number].filetype ~= "dap-repl" then
					return true
				end
			end,
			offsets = {
				{ filetype = "nerdtree", text = "File Explorer", highlight = "Directory", text_align = "center" },
			},
			color_icons = true,
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			sort_by = 'id',
			groups = {
				options = {
					toggle_hidden_on_enter = true
				},
				items = {
					groups.builtin.pinned,
					{
						name = 'Models',
						-- separator = {
						-- 	style = groups.separator.tab,
						-- },
						-- auto_close = true,
						matcher = function(buf)
							return buf.filename:match('%.model.ts') or buf.path:match('%/models/index.ts')
						end
					},
					{
						name = 'Services',
						matcher = function(buf)
							return buf.filename:match('%.service.ts') or buf.path:match('%/services/index.ts')
						end
					},
					{
						name = 'Hooks',
						matcher = function(buf)
							return buf.filename:match('%.hook.ts') or buf.path:match('%hooks/index.ts')
						end
					},
					{
						name = 'Views',
						matcher = function(buf)
							return buf.filename:match('%.view.tsx') or buf.path:match('%views/index.ts')
						end
					},
					groups.builtin.ungrouped,
				}
			}
		},
	}
end
