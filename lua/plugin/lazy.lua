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
	"voldikss/vim-floaterm",

	-- colorscheme
	require("plugin.colorscheme.gruvbox"),
	require("plugin.colorscheme.tokyonight"),
	require("plugin.colorscheme.catppuccin"),

	-- git
	require("plugin.git.fugitive"),
	require("plugin.git.lazygit"),
	require("plugin.git.neogit"),
	require("plugin.git.git"),

	-- snippets
	require("plugin.snippet.friendly-snippets"),
	require("plugin.snippet.luasnip"),
	require("plugin.snippet.ultisnips"),

	-- format
	require("plugin.format.indent-line"),
	require("plugin.format.formatter"),

	-- Navigation
	require("plugin.navigation.telescope"),
	require("plugin.navigation.dashboard"),
	-- require("plugin.navigation.navigator"),
	require("plugin.navigation.nvim-tree"),
	require("plugin.navigation.project"),
	require("plugin.navigation.spectre"),
	require("plugin.navigation.ranger"),
	require("plugin.navigation.barbar"),
	require("plugin.navigation.hop"),
	-- require("plugin.navigation.neotree"),

	-- visualize
	require("plugin.visualize.icon"),
	require("plugin.visualize.parser"),
	require("plugin.visualize.lualine"),
	require("plugin.visualize.orgmode"),
	require("plugin.visualize.autopair"),
	require("plugin.visualize.highlight"),
	require("plugin.visualize.treesitter"),
	require("plugin.visualize.markdown-preview"),

	-- operation
	require("plugin.k9s"),
	require("plugin.kubectl"),
	require("plugin.rest"),

	-- code
	require("plugin.code.tabnine"),
	require("plugin.code.mason"),
	require("plugin.code.saga"),
	require("plugin.code.cmp"),
	require("plugin.code.lsp"),
	require("plugin.code.debugger"),
	require("plugin.code.linter"),

	-- task
	require("plugin.task.pomodoro"),

	-- typescipe
	require("plugin.typescipt.typescipt"),

	-- rust
	require("plugin.rust.crates"),
	require("plugin.rust.rustacean"),

})
