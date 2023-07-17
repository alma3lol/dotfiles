local M = {}

M.SourceSelectedLines = function()
	if vim.fn.expand('%:e') == #'lua' then
		vim.execute(vim.fn.printf(":lua %s", vim.fn.join(vim.fn.getline("'<", "'>"), '<Bar>')))
	else
		vim.execute(vim.fn.printf(':exe %s', vim.fn.join(vim.fn.getline("'<", "'>"), '<Bar>')))
	end
end

M.SourceCurrentLine = function()
	if vim.fn.expand('%:e') == #'lua' then
		vim.execute(vim.fn.printf(":lua %s", vim.fn.getline(".")))
	else
		vim.fn.getline('>')
	end
end

M.SourceCurrentFile = function()
	if vim.fn.expand('%:e') == #'lua' then
		require(vim.fn.expand("%"))
	else
		vim.cmd [[ so % ]]
	end
end

M.QuickFixToggle = function()
	for i = 1, vim.fn.winnr('$') do
		local bnum = vim.fn.winbufnr(i)
		if vim.fn.getbufvar(bnum, '&buftype') == 'quickfix' then
			vim.cmd [[ cclose ]]
			return
		end
	end
	vim.cmd [[ copen ]]
end

M.FindInProjectQuickFixList = function()
	local find = vim.input("Find in project > ")
	local files = vim.input("Path pattern > ")
	vim.execute('vimgrep ' .. find .. files)
end

M.CharacterRequiresUrlEncoding = function(character)
	local ascii_code = vim.fn.char2nr(character)
	if ascii_code >= 48 and ascii_code <= 57 then
		return false
	elseif ascii_code >= 65 and ascii_code <= 90 then
		return false
	elseif ascii_code >= 97 and ascii_code <= 122 then
		return false
	elseif character == "-" or character == "_" or character == "." or character == "~" then
		return false
	end
	return true
end

M.UrlEncode = function(string)
	local result = ""
	local characters = vim.fn.split(string, '.\zs')
	for character in characters do
		if character == " " then
			result = result .. "+"
		elseif M.CharacterRequiresUrlEncoding(character) then
			local i = 0
			while i < vim.fn.strlen(character) do
				local byte = vim.fn.strpart(character, i, 1)
				local decimal = vim.fn.char2nr(byte)
				result = result .. "%" .. vim.fn.printf("%02x", decimal)
				i = i + 1
			end
		else
			result = result .. character
		end
	end
	return result
end

M.GenerateCTagsForCurrentFile = function()
	local currentProjectCTagsFile = vim.fn.getcwd() .. '/.ctags'
	if vim.fn.filereadable(currentProjectCTagsFile) then
		vim.execute("!ctags -f " ..
			vim.fn.shellescape(vim.env.CTAGS_DIR .. M.UrlEncode(vim.fn.expand('%:p')), 1) ..
			' --options=' .. vim.fn.shellescape(currentProjectCTagsFile, 1) .. ' "%"')
	else
		vim.execute("!ctags -f " ..
			vim.fn.shellescape(vim.env.CTAGS_DIR .. M.UrlEncode(vim.fn.expand('%:p')), 1) .. ' "%"')
	end
end

M.CreateJupyterAscendingNotebook = function()
	local fileName = vim.input('New notebook name > ')
	if fileName == '' then
		return
	end
	local currentDirectory = vim.fn.expand('%:p')
	vim.execute("!python -m jupyter_ascending.scripts.make_pair --base " ..
		vim.fn.shellescape(currentDirectory .. "/" .. fileName, 1))
end

M.HoverInfo = function()
	local debugSession = require('dap').session()
	-- local status = debugSession.status();
	-- print(debugSession)
	-- print(status)
	if debugSession == nil or debugSession.stopped_thread_id == nil then
		require('lspsaga.hover').render_hover_doc()
	else
		-- require 'dap.ui.variables'.hover()
	end
end

M.lsp_client_names = function()
	local clients = {}

	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end

	return table.concat(clients, ' '), ' '
end

M.battery_status = function()
	local backend = vim.fn['battery#backend']()
	local value = backend.value
	local is_charging = backend.is_charging
	local icon = '?? '
	if (value >= 0) then
		icon = ' '
	end
	if (value >= 10) then
		icon = ' '
	end
	if (value >= 20) then
		icon = ' '
	end
	if (value >= 30) then
		icon = ' '
	end
	if (value >= 40) then
		icon = ' '
	end
	if (value >= 50) then
		icon = ' '
	end
	if (value >= 60) then
		icon = ' '
	end
	if (value >= 70) then
		icon = ' '
	end
	if (value >= 80) then
		icon = ' '
	end
	if (value >= 90) then
		icon = ' '
	end
	if (value == 100) then
		icon = ' '
	end
	if (is_charging == 1) then
		icon = ' '
	end
	return icon .. tostring(value) .. '%%'
end

return M
