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

vim.g.mapleader = " "      -- for normal mode
vim.g.maplocalleader = " " -- for local leader mappings
vim.opt.title = true
vim.opt.hlsearch = true
-- vim.opt.shell = "/opt/homebrew/bin/zsh"
vim.opt.history = 200
vim.opt.background = 'dark'
vim.opt.paste = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.laststatus = 2
vim.opt.cursorline = true

local plugins = {
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
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>",
				{ desc = "Toggle Outline" })

			require("outline").setup {
				-- Your setup opts here (leave empty to use defaults)
			}
		end,
	},
	{
		'ray-x/navigator.lua',
		dependencies = {
			{ 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	{
		'saecki/crates.nvim',
		tag = 'stable',
		config = function()
			require('crates').setup()
		end,
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	'LukasPietzschmann/telescope-tabs',
	'ahmedkhalf/project.nvim',
	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',
		ft = { 'org' },
		config = function()
			-- Setup orgmode
			require('orgmode').setup({
				org_agenda_files = '~/orgfiles/**/*',
				org_default_notes_file = '~/orgfiles/refile.org',
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
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				'<c-up>',
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = '<f1>',
			},
		},
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
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"Ramilito/kubectl.nvim",
	{
		{
			"ramilito/kubectl.nvim",
			config = function()
				require("kubectl").setup()
			end,
		},
	},
	"fsouza/prettierd",
	"jose-elias-alvarez/null-ls.nvim",
	"p00f/nvim-ts-rainbow",
	'brenoprata10/nvim-highlight-colors',
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{ "catppuccin/nvim",     name = "catppuccin",       priority = 1000 },
	'diepm/vim-rest-console',
	'nvim-pack/nvim-spectre',
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		'nvim-tree/nvim-tree.lua'
	},
	{
		'hsalem7/nvim-k8s'
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
		config = true
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
			}
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	},
	{ 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
	'rbgrouleff/bclose.vim',
	'francoiscabrol/ranger.vim',
	'wbthomason/packer.nvim',
	'nvim-treesitter/nvim-treesitter',
	'folke/tokyonight.nvim',
	'kdheepak/lazygit.nvim',
	--'ryanoasis/vim-devicons',
	'phaazon/hop.nvim',
	'Yggdroot/indentLine',
	'ellisonleao/gruvbox.nvim',
	{ 'junegunn/fzf',    run = ":call fzf#install()" },
	{ 'junegunn/fzf.vim' },
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons', -- optional,
	'voldikss/vim-floaterm',
	'SirVer/ultisnips',
	'dinhhuy258/git.nvim',
	'tpope/vim-fugitive',
	'airblade/vim-gitgutter',
	'preservim/nerdtree',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	'nvim-lualine/lualine.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'glepnir/lspsaga.nvim',
	'nvim-treesitter/nvim-treesitter',
	'jose-elias-alvarez/typescript.nvim',
	'onsails/lspkind.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'jayp0521/mason-null-ls.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope-fzf-native.nvim',
	'nvim-telescope/telescope.nvim',
	'antosha417/nvim-lsp-file-operations',
	'WhoIsSethDaniel/mason-tool-installer.nvim'
}

local opts = {}

require("lazy").setup(plugins, opts)

-- shfmt configuration for Bash
local shfmt = {
	formatCommand = "shfmt -i 2 -ci -s",
	formatStdin = true
}

-- gofmt configuration for Go
local gofmt = {
	formatCommand = "gofmt",
	formatStdin = true
}

-- rustfmt configuration for Rust
local rustfmt = {
	formatCommand = "rustfmt",
	formatStdin = true
}

-- Prettier configuration
local prettier = {
	formatCommand = 'prettierd "${INPUT}"',
	formatStdin = true,
	env = {
		string.format('PRETTIERD_DEFAULT_CONFIG=%s',
			vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
	},
}

-- Ensure termguicolors is enabled if not already
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
local function tab_win_closed(winnr)
	local api = require "nvim-tree.api"
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w) return w ~= winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else                                           -- else closed buffer was normal buffer
		if #tab_bufs == 1 then                 -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
				vim.schedule(function()
					if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
						vim.cmd "quit" -- then close all of vim
					else           -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true
})

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- pass to setup along with your other options
-- require("nvim-tree").setup {
-- ---
-- on_attach = my_on_attach,
-- ---
-- }

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
require("core.colorscheme")
require("core.keymap")
require("core.format")
require("core.vim")

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
