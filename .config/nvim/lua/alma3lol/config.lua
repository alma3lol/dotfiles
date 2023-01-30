return function()
	vim.env.vimPlugPath = vim.fn.stdpath('data') .. "/site/autoload/plug.vim"
	vim.cmd [[ so $vimPlugPath ]]
	for _, dir in ipairs({ 'backup', 'undodir', 'directory', 'ctags' }) do
		if not vim.fn.isdirectory(vim.fn.stdpath('data') .. '/' .. dir) then
			vim.fn.mkdir(vim.fn.stdpath('data') .. '/' .. dir)
		end
	end

	vim.g.mapleader = " "
	vim.g.maplocalleader = ","
	vim.g.vim_json_conceal = 0
	vim.opt.syntax = "on"
	vim.opt.completeopt = 'menu,menuone,noselect'
	vim.opt.ff = 'unix'
	vim.opt.mouse = 'a'
	vim.opt.modelines = 0
	vim.opt.wrap = true
	vim.opt.pastetoggle = '<F2>'
	vim.opt.formatoptions = 'tcqrn1'
	vim.opt.errorbells = false
	vim.opt.autoindent = true
	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.softtabstop = 4
	vim.opt.expandtab = false
	vim.opt.shiftround = false
	vim.opt.scrolloff = 5
	vim.opt.backspace = 'indent,eol,start'
	vim.opt.ttyfast = true
	vim.opt.laststatus = 2
	vim.opt.showcmd = true
	vim.o.matchpairs = "(:),{:},[:],<:>,':',\":\""
	vim.opt.list = true
	vim.opt.listchars = 'tab:> ,trail:*,extends:#,nbsp:.,eol:↴,space:·'
	vim.opt.number = true
	vim.opt.encoding = 'utf-8'
	vim.opt.incsearch = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.viminfo = "'100,<9999,s100"
	vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir/'
	vim.opt.backupdir = vim.fn.stdpath('data') .. '/backup/'
	vim.opt.directory = vim.fn.stdpath('data') .. '/directory/'
	vim.opt.undofile = true
	vim.opt.swapfile = true
	vim.opt.backup = true
	vim.opt.smartindent = true
	vim.opt.termguicolors = true
	vim.opt.relativenumber = true
	vim.opt.hlsearch = false
	vim.opt.scrolloff = 8
	vim.opt.showmode = false
	vim.opt.cmdheight = 2
	vim.opt.compatible = false
	vim.opt.hidden = true
	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
	vim.opt.cursorline = true
	vim.opt.foldenable = true
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldnestmax = 1
	vim.opt.runtimepath = vim.opt.runtimepath + ',' + vim.fn.expand('$CWD/treesitter')
	vim.g.instant_username = "Alma3lol"
	vim.g.dashboard_default_executive = 'telescope'
	vim.g["test#strategy"] = "neovim"
	vim.cmd [[ colorscheme nord ]]
end
