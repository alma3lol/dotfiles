local M = {}

M.ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

M.packer_bootstrap = M.ensure_packer()

M.setup = function()
	require('packer').reset()
	require('packer').init({
		git = {
			clone_timeout = false
		}
	})
	require('packer').startup(function(use)
		use 'wbthomason/packer.nvim'
		use 'lambdalisue/battery.vim'
		use 'preservim/nerdtree'
		use 'AndrewRadev/sideways.vim'
		use 'mbbill/undotree'
		use 'vuciv/vim-bujo'
		use 'tpope/vim-dispatch'
		use 'tpope/vim-fugitive'
		use 'leafgarland/typescript-vim'
		use 'peitalin/vim-jsx-typescript'
		use 'vim-utils/vim-man'
		use 'szw/vim-maximizer'
		use 'sheerun/vim-polyglot'
		use 'jremmen/vim-ripgrep'
		use 'tpope/vim-surround'
		use 'mg979/vim-visual-multi'
		use 'mhinz/vim-signify'
		use 'tpope/vim-rhubarb'
		use 'junegunn/gv.vim'
		use 'ryanoasis/vim-devicons'
		use 'mhinz/vim-startify'
		use 'kevinoid/vim-jsonc'
		use 'voldikss/vim-floaterm'
		use 'jiangmiao/auto-pairs'
		use 'mattn/emmet-vim'
		use 'easymotion/vim-easymotion'
		use 'preservim/tagbar'
		use 'ternjs/tern_for_vim'
		use { 'Shougo/denite.nvim', run = ':UpdateRemotePlugins' }
		use 'nvim-lua/popup.nvim'
		use 'nvim-lua/plenary.nvim'
		use 'nvim-telescope/telescope.nvim'
		use 'nvim-telescope/telescope-file-browser.nvim'
		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		use 'nvim-telescope/telescope-symbols.nvim'
		use 'neovim/nvim-lspconfig'
		use 'hrsh7th/cmp-nvim-lsp-signature-help'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'
		use 'tami5/lspsaga.nvim'
		use 'vim-syntastic/syntastic'
		use 'nvim-telescope/telescope-media-files.nvim'
		use 'mfussenegger/nvim-dap'
		use 'nvim-telescope/telescope-dap.nvim'
		use 'kyazdani42/nvim-web-devicons'
		use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
		use 'nvim-treesitter/playground'
		use 'unblevable/quick-scope'
		use 'justinmk/vim-sneak'
		use 'nvim-telescope/telescope-project.nvim'
		use 'vim-ctrlspace/vim-ctrlspace'
		use 'dense-analysis/ale'
		use 'bufbuild/vim-buf'
		use 'gbrlsnchs/telescope-lsp-handlers.nvim'
		use 'norcalli/nvim-terminal.lua'
		use 'xiyaowong/telescope-emoji.nvim'
		use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
		use 'camgraff/telescope-tmux.nvim'
		use 'rcarriga/nvim-dap-ui'
		use 'theHamsta/nvim-dap-virtual-text'
		use 'williamboman/nvim-lsp-installer'
		use 'editorconfig/editorconfig-vim'
		use { 'akinsho/nvim-bufferline.lua', tag = 'v3.*' }
		use 'lewis6991/gitsigns.nvim'
		use 'akinsho/nvim-toggleterm.lua'
		use 'ray-x/aurora'
		use 'nvim-lua/lsp-status.nvim'
		use 'folke/lsp-colors.nvim'
		use 'folke/trouble.nvim'
		use 'Shadorain/shadotheme'
		use 'jbyuki/instant.nvim'
		use 'pwntester/octo.nvim'
		use 'elzr/vim-json'
		use 'neoclide/jsonc.vim'
		use 'MunifTanjim/nui.nvim'
		use 'vuki656/package-info.nvim'
		use 'simrat39/symbols-outline.nvim'
		use 'ThePrimeagen/harpoon'
		use 'mtth/scratch.vim'
		use 'ctrlpvim/ctrlp.vim'
		-- use 'tami5/sqlite.lua'
		use 'nvim-telescope/telescope-frecency.nvim'
		use 'vim-test/vim-test'
		use 'shaunsingh/nord.nvim'
		use 'AckslD/nvim-neoclip.lua'
		use 'RRethy/nvim-treesitter-textsubjects'
		use 'nvim-treesitter/nvim-treesitter-textobjects'
		use 'nvim-treesitter/nvim-treesitter-refactor'
		use 'folke/twilight.nvim'
		use 'folke/zen-mode.nvim'
		use 'p00f/nvim-ts-rainbow'
		use 'romgrk/nvim-treesitter-context'
		use 'SmiteshP/nvim-gps'
		use 'JoosepAlviste/nvim-ts-context-commentstring'
		use 'andymass/vim-matchup'
		use 'booperlv/nvim-gomove'
		use 'rmagatti/auto-session'
		use 'rmagatti/session-lens'
		-- use 'nvim-neorg/neorg'
		use 'untitled-ai/jupyter_ascending.vim'
		use 'michaeljsmith/vim-indent-object'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'lukas-reineke/lsp-format.nvim'
		use 'onsails/lspkind-nvim'
		use 'haringsrob/nvim_context_vt'
		use { 'folke/tokyonight.nvim', branch = 'main' }
		use 'kdheepak/lazygit.nvim'
		use 'numToStr/Comment.nvim'
		use 'nvim-lualine/lualine.nvim'
		use 'folke/todo-comments.nvim'
		use 'windwp/nvim-spectre'
		use { 'michaelb/sniprun', run = 'bash install.sh' }
		use 'L3MON4D3/LuaSnip'
		use 'rafamadriz/friendly-snippets'
		use 'saadparwaiz1/cmp_luasnip'
		use 'LinArcX/telescope-command-palette.nvim'
		-- use 'ilAYAli/scMRU.nvim'
		use 'linty-org/key-menu.nvim'
		use 'gbprod/substitute.nvim'
		use 'natecraddock/workspaces.nvim'
		use 'tpope/vim-abolish'
		use 'nvim-telescope/telescope-ui-select.nvim'
		use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
		use { 'phaazon/mind.nvim', branch = 'v2.2' }
		use 'pantharshit00/vim-prisma'
		-- use 'haishanh/night-owl.vim'
		use 'shift-d/scratch.nvim'
		use 'woosaaahh/sj.nvim'
		use 'olrtg/nvim-rename-state'
		use 'otavioschwanck/telescope-alternate'
		use 'alex-laycalvert/flashcards.nvim'
		use 'gennaro-tedesco/nvim-jqx'
		use 'alma3lol/vim-run-in-blender'
		use 'ziontee113/neo-minimap'
		use 'rcarriga/nvim-notify'
		use 'segeljakt/vim-silicon'
		use 'lambdalisue/suda.vim'
		use 'michaeldyrynda/carbon.vim'
		use 'xiyaowong/nvim-transparent'
		use 'cshuaimin/ssr.nvim'
		use 'williamboman/mason.nvim'
		use 'williamboman/mason-lspconfig.nvim'
		use 'kkharji/sqlite.lua'
		use 'mrjones2014/legendary.nvim'
		use 'olimorris/onedarkpro.nvim'
		use 'norcalli/nvim-colorizer.lua'
		use 'Djancyp/custom-theme.nvim'
		use 'AlexvZyl/nordic.nvim'
		use 'imsnif/kdl.vim'
		use 'elkowar/yuck.vim'
		use 'kovetskiy/sxhkd-vim'
		use {
			"princejoogie/chafa.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"m00qek/baleia.nvim"
			},
		}
		use 'ziontee113/SnippetGenie'
		if M.packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return M
