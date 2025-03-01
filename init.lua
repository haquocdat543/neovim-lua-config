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

require("nvim-treesitter.configs").setup {
	highlight = {
		-- ...
	},
	-- ...
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	}
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

-- terraform lsp
require 'lspconfig'.terraformls.setup {}
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- init.lua

require('nvim-treesitter.configs').setup {
	-- Add languages to be installed here that you want installed for treesitter
	-- ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	rainbow = {
		enable = false, -- disable rainbow for now
	},
	auto_install = true,
	ensure_installed = { "javascript", "c", "lua", "vim", "vimdoc", "helm", "dockerfile", "yaml", "gotmpl" },
	-- open_on_setup = true,
	highlight = { enable = true },
	indent = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-f>',
			node_incremental = '<c-f>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-f>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				[',a'] = '@parameter.inner',
			},
			swap_previous = {
				[',A'] = '@parameter.inner',
			},
		},
	},
}

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-j>'] = cmp.mapping.scroll_docs(-4),
		['<C-k>'] = cmp.mapping.scroll_docs(4),
		['<C-b>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},

	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	opts.buffer = bufnr
	keymap.set("n", "gs", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
	keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "gn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "gp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "gP", "<Cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, ",ca", vim.lsp.buf.code_action, opts)
	opts.desc = "Smart rename"
	keymap.set("n", ",rn", vim.lsp.buf.rename, opts)
	opts.desc = "Show buffer diagnostics"
	keymap.set("n", ",D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
	opts.desc = "Show line diagnostics"
	keymap.set("n", ",d", vim.diagnostic.open_float, opts)
	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	opts.desc = "Restart LSP"
	keymap.set("n", ",rs", ":LspRestart<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
lspconfig["ts_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure jsonls server
lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure terraformls server
lspconfig["terraformls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure groovy language server
lspconfig["groovyls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure gradle ls language server
lspconfig["gradle_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure clangd server
lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure sqlls server
lspconfig["sqlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure clangd server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Mason and lsp configuration. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
require 'lspconfig'.gopls.setup {}

require 'lspconfig'.clangd.setup {}

require 'lspconfig'.efm.setup {
	init_options = { documentFormatting = true },
	filetypes = { 'python', 'cpp', 'lua', 'go', 'rust', 'bash', 'sh', 'groovy' },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			javascript = { prettier },
			typescript = { prettier },
			json = { prettier },
			html = { prettier },
			css = { prettier },
			bash = { shfmt },
			go = { gofmt },
			rust = { rustfmt }
		}
	}
}

require 'lspconfig'.bashls.setup {}

require 'lspconfig'.sqlls.setup {}

require 'lspconfig'.pyright.setup {}

require 'lspconfig'.terraformls.setup {}

require 'lspconfig'.jsonls.setup {}

require 'lspconfig'.gradle_ls.setup {}

require 'lspconfig'.groovyls.setup {}

require 'lspconfig'.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			}
		}
	}
}

-- configure svelte server
lspconfig["svelte"].setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				if client.name == "svelte" then
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end
			end,
		})
	end,
})

-- configure prisma orm server
lspconfig["prismals"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure graphql language server
lspconfig["graphql"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure python server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"svelte",
		"lua_ls",
		"graphql",
		"emmet_ls",
		"prismals",
		"pyright",
		"rust_analyzer",
		"clangd",
		"gopls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		"isort", -- python formatter
		"black", -- python formatter
		"pylint", -- python linter
		"eslint_d", -- js linter
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
	},
})

-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}

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
