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
	require("plugin.colorscheme.solarized"),

	-- git
	require("plugin.git.fugitive"),
	require("plugin.git.lazygit"),
	require("plugin.git.neogit"),
	require("plugin.git.git"),
	require("plugin.git.gitgutter"),
	require("plugin.git.gitsigns"),

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
	require("plugin.navigation.grugfar"),
	require("plugin.navigation.ranger"),
	require("plugin.navigation.barbar"),
	require("plugin.navigation.hop"),
	require("plugin.navigation.neotree"),
	require("plugin.navigation.multiline"),
	require("plugin.navigation.undotree"),
	require("plugin.navigation.which-keys"),
	require("plugin.navigation.sshfs"),
	require("plugin.navigation.neoscroll"),
	require("plugin.navigation.auto-session"),

	-- visualize
	require("plugin.visualize.icon"),
	require("plugin.visualize.parser"),
	require("plugin.visualize.lualine"),
	require("plugin.visualize.orgmode"),
	require("plugin.visualize.autopair"),
	require("plugin.visualize.autotag"),
	require("plugin.visualize.highlight"),
	require("plugin.visualize.treesitter"),
	require("plugin.visualize.markdown-preview"),
	require("plugin.visualize.indent"),
	require("plugin.visualize.noice"),
	require("plugin.visualize.trouble"),
	require("plugin.visualize.namu"),
	require("plugin.visualize.crypto"),

	-- operation
	require("plugin.operation.k9s"),
	require("plugin.operation.kubectl"),
	require("plugin.operation.rest"),
	require("plugin.operation.graphql"),
	require("plugin.operation.floatterm"),

	-- code
	require("plugin.code.tabnine"),
	require("plugin.code.mason"),
	require("plugin.code.saga"),
	require("plugin.code.cmp"),
	require("plugin.code.lsp"),
	require("plugin.code.debugger"),
	require("plugin.code.linter"),
	require("plugin.code.surround"),
	require("plugin.code.conform"),
	require("plugin.code.ollama"),
	require("plugin.code.codecompanion"),
	require("plugin.code.parrot"),
	require("plugin.code.mcphub"),
	require("plugin.code.avante"),
	require("plugin.code.openscad"),
	require("plugin.code.tidal-vim"),
	require("plugin.code.tidal2"),
	require("plugin.code.sonicpi"),
	require("plugin.code.supercollider"),
	require("plugin.code.strudel"),
	require("plugin.code.opencode"),

	-- task
	require("plugin.task.pomodoro"),
	require("plugin.task.todo-comments"),

	-- typescipe
	require("plugin.typescipt.typescipt"),

	-- rust
	require("plugin.rust.crates"),
	require("plugin.rust.rustacean"),
	require("plugin.rust.rustowl"),

	-- misc
	require("plugin.misc.bclose"),
}, {
	rocks = {
		enabled = false,
	},
	install = {
		missing = true,
	},
	checker = {
		enabled = false, -- no update checking
	},
	change_detection = {
		enabled = false, -- no reload on config change
		notify = false,
	},
})
