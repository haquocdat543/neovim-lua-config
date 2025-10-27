return {
	"thgrund/tidal.nvim",
	opts = {
		-- Your configuration here
		-- See configuration section for defaults
	},
	-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "haskell", "supercollider" } },
	},

	vim.keymap.set("n", "<leader>t1", ":TidalLaunch<CR>"),
	vim.keymap.set("n", "<leader>t2", ":TidalQuit<CR>"),
	vim.keymap.set("n", "<leader>t3", ":TidalStartEventHighlighting<CR>"),
	vim.keymap.set("n", "<leader>t4", ":TidalStopEventHighlighting<CR>"),

}
