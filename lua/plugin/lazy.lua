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
	"rbgrouleff/bclose.vim",
	"francoiscabrol/ranger.vim",
	"Yggdroot/indentLine",
	"voldikss/vim-floaterm",
	"SirVer/ultisnips",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"jose-elias-alvarez/typescript.nvim",

	-- colorscheme
	require("plugin.colorscheme.gruvbox"),
	require("plugin.colorscheme.tokyonight"),
	require("plugin.colorscheme.catppuccin"),

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
	require("plugin.lualine"),
	require("plugin.highlight"),
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
	require("plugin.orgmode"),
	require("plugin.barbar"),
	require("plugin.autopair"),
	require("plugin.markdown-preview"),
	-- require("plugin.neotree"),
})
