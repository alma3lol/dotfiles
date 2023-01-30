local M = {
	setup = function() end
}

M.default_opts = { noremap = true, silent = true }

M.nnoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.keymap.set('n', key, action, opts)
end

M.nremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('n', key, action, opts)
end

M.inoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('i', key, action, opts)
end

M.iremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('i', key, action, opts)
end

M.vnoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('v', key, action, opts)
end

M.vremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('v', key, action, opts)
end

M.onoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('o', key, action, opts)
end

M.oremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('o', key, action, opts)
end

M.xnoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('x', key, action, opts)
end

M.xremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('x', key, action, opts)
end

M.tnoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('t', key, action, opts)
end

M.tremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('t', key, action, opts)
end

M.snoremap = function(key, action, options)
	local opts = M.default_opts
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('s', key, action, opts)
end

M.sremap = function(key, action, options)
	local opts = { noremap = false, silent = true }
	if options then
		for k, v in ipairs(options) do
			opts[k] = v
		end
	end
	return vim.api.nvim_set_keymap('s', key, action, opts)
end
return M
