-- ~/.config/nvim/lua/plugins/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Import plugin configurations
require("lazy").setup({
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})

			-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
			-- add ~org~ to ignore_install
			-- require('nvim-treesitter.configs').setup({
			-- sure_installed = 'all',
			-- ignore_install = { 'org' },
			-- })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{ "catppuccin/nvim",     name = "catppuccin",       priority = 1000 },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",  -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	"brenoprata10/nvim-highlight-colors",
	dependencies = { "nvim-lua/plenary.nvim" },
	"rbgrouleff/bclose.vim",
	"francoiscabrol/ranger.vim",
	"wbthomason/packer.nvim",
	"folke/tokyonight.nvim",
	"phaazon/hop.nvim",
	"Yggdroot/indentLine",
	"ellisonleao/gruvbox.nvim",
	{ "junegunn/fzf", run = ":call fzf#install()" },
	"junegunn/fzf.vim",
	"voldikss/vim-floaterm",
	"SirVer/ultisnips",
	"dinhhuy258/git.nvim",
	"tpope/vim-fugitive",
	"airblade/vim-gitgutter",
	"preservim/nerdtree",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"williamboman/mason.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"nvim-lua/plenary.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"williamboman/mason-lspconfig.nvim",
	require("plugin.lazygit"),
	require("plugin.k9s"),
	require("plugin.project"),
	require("plugin.git"),
	require("plugin.tabnine"),
	require("plugin.icon"),
	require("plugin.neogit"),
	require("plugin.spectre"),
	require("plugin.telescope"),
	require("plugin.hop"),
	require("plugin.tokyonight"),
	require("plugin.lualine"),
	require("plugin.hightlight"),
	require("plugin.nvim-tree"),
	require("plugin.mason"),
	require("plugin.saga"),
	require("plugin.treesitter"),
	require("plugin.cmp"),
	require("plugin.lsp"),
	require("plugin.formatter"),
	require("plugin.debugger"),
	require("plugin.linter"),
	require("plugin.rest"),
	require("plugin.kubectl"),
	require("plugin.dashboard"),
	require("plugin.crates"),
	require("plugin.pomodoro"),
	require("plugin.rustacean"),
})
