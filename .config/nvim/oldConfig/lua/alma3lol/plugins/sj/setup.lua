return function()
	local sj = require("sj")

	sj.setup({
		auto_jump = true,
		use_overlay = true,
	})

	vim.api.nvim_create_user_command('SJRun', sj.run, {})
end
