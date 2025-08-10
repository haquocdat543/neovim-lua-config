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

	-- colorscheme
	require("plugin.colorscheme.gruvbox"),
	require("plugin.colorscheme.tokyonight"),
	require("plugin.colorscheme.catppuccin"),
	require("plugin.colorscheme.dracula"),

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
	require("plugin.navigation.oil"),
	require("plugin.navigation.nvim-tree"),
	require("plugin.navigation.project"),
	require("plugin.navigation.spectre"),
	require("plugin.navigation.ranger"),
	require("plugin.navigation.barbar"),
	require("plugin.navigation.hop"),
	-- require("plugin.navigation.neotree"),
	require("plugin.navigation.multiline"),

	-- visualize
	require("plugin.visualize.icon"),
	require("plugin.visualize.parser"),
	require("plugin.visualize.lualine"),
	require("plugin.visualize.orgmode"),
	require("plugin.visualize.autopair"),
	require("plugin.visualize.highlight"),
	require("plugin.visualize.treesitter"),
	require("plugin.visualize.markdown-preview"),
	require("plugin.visualize.indent"),
	require("plugin.visualize.gitsigns"),

	-- operation
	require("plugin.operation.k9s"),
	require("plugin.operation.kubectl"),
	require("plugin.operation.rest"),
	require("plugin.operation.graphql"),
	require("plugin.operation.floatterm"),

	-- code
	require("plugin.code.copilot"),
	require("plugin.code.tabnine"),
	require("plugin.code.mason"),
	require("plugin.code.saga"),
	require("plugin.code.cmp"),
	require("plugin.code.lsp"),
	require("plugin.code.debugger"),
	require("plugin.code.linter"),
	require("plugin.code.surround"),
	require("plugin.code.conform"),

	-- task
	require("plugin.task.pomodoro"),

	-- typescipe
	require("plugin.typescipt.typescipt"),

	-- rust
	require("plugin.rust.crates"),
	require("plugin.rust.rustacean"),

	-- misc
	require("plugin.misc.bclose"),
})
