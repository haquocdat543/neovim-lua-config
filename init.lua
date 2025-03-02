local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- for normal mode

local plugins = {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- UI for DAP
			"leoluz/nvim-dap-go", -- DAP for Go
			"nvim-neotest/nvim-nio"
		},
	},
	{
		"epwalsh/pomo.nvim",
		version = "*", -- Recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
		dependencies = {
			-- Optional, but highly recommended if you want to use the "Default" timer
			"rcarriga/nvim-notify",
		},
		opts = {
			-- See below for full list of options 👇
			work_time = 25,
			break_time = 5,
			long_break_time = 15,
			notifier = {
				sticky = true,
			},
			sessions = {
				-- Example session configuration for a session called "pomodoro".
				pomodoro = {
					{ name = "Work",        duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work",        duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work",        duration = "25m" },
					{ name = "Long Break",  duration = "15m" },
				},
			},
		},
	},
	{
		"ray-x/navigator.lua",
		dependencies = {
			{ "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
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
		"sphamba/smear-cursor.nvim",
		opts = {
			-- Smear cursor color. Defaults to Cursor GUI color if not set.
			-- Set to "none" to match the text color at the target cursor position.
			cursor_color = "#d3cdc3",

			-- Background color. Defaults to Normal GUI background color if not set.
			normal_bg = "#282828",

			-- Smear cursor when switching buffers or windows.
			smear_between_buffers = true,

			-- Smear cursor when moving within line or to neighbor lines.
			smear_between_neighbor_lines = true,

			-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
			-- Smears will blend better on all backgrounds.
			legacy_computing_symbols_support = false,
		},
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
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
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
	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	"LukasPietzschmann/telescope-tabs",
	"ahmedkhalf/project.nvim",
	"ramilito/kubectl.nvim",
	"brenoprata10/nvim-highlight-colors",
	"diepm/vim-rest-console",
	"nvim-pack/nvim-spectre",
	"nvim-tree/nvim-tree.lua",
	"hsalem7/nvim-k8s",
	"rbgrouleff/bclose.vim",
	"francoiscabrol/ranger.vim",
	"wbthomason/packer.nvim",
	"nvim-treesitter/nvim-treesitter",
	"folke/tokyonight.nvim",
	"kdheepak/lazygit.nvim",
	"phaazon/hop.nvim",
	"Yggdroot/indentLine",
	"ellisonleao/gruvbox.nvim",
	{ "junegunn/fzf",    run = ":call fzf#install()" },
	"junegunn/fzf.vim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons", -- optional,
	"voldikss/vim-floaterm",
	"SirVer/ultisnips",
	"dinhhuy258/git.nvim",
	"tpope/vim-fugitive",
	"airblade/vim-gitgutter",
	"preservim/nerdtree",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"nvim-lualine/lualine.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"glepnir/lspsaga.nvim",
	"nvim-treesitter/nvim-treesitter",
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
	"nvim-telescope/telescope.nvim",
	"antosha417/nvim-lsp-file-operations",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"mhartington/formatter.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)

require("core.colorscheme")
require("core.keymap")
require("core.format")
require("core.option")
require("core.vim")
require("core.function")

require("plugin.lazygit")
require("plugin.k9s")
require("plugin.navigator")
require("plugin.project")
require("plugin.git")
require("plugin.tabnine")
require("plugin.icon")
require("plugin.neogit")
require("plugin.spectre")
require("plugin.telescope")
require("plugin.hop")
require("plugin.tokyonight")
require("plugin.lualine")
require("plugin.hightlight")
require("plugin.nvim-tree")
require("plugin.parser")
require("plugin.mason")
require("plugin.saga")
require("plugin.treesitter")
require("plugin.cmp")
require("plugin.lsp")
require("plugin.formatter")
require("plugin.debugger")

require("plugin.kubectl")
require("plugin.dashboard")
