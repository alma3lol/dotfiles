return function()
	require('treesitter-context').setup {
		enable = true,
		throttle = true,
		max_lines = 0,
		patterns = {
			default = {
				'class',
				'function',
				'method',
				'for',
				'while',
				'if',
				'switch',
				'case',
			},
		},
	}
end
