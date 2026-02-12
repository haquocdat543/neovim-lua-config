return {
	"thgrund/tidal.nvim",
	enabled = false,
	opts = {
		-- Your configuration here
		-- See configuration section for defaults
		mappings = {
			send_line = { mode = { "i", "n" }, key = "<leader>t6" },
			send_visual = { mode = { "x" }, key = "<leader>t5" },
			send_block = { mode = { "i", "n", "x" }, key = "<leader>t4" },
			send_node = { mode = "n", key = "<leader>t7" },
			send_silence = { mode = "n", key = "<leader>t3" },
			send_hush = { mode = "n", key = "<leader>t2" },
		},
	},
	-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"haskell",
				"supercollider",
			}
		},
	},
	keys = {
		{
			"<leader>t1",
			":TidalLaunch<CR>:TidalStartEventHighlighting<CR>",
		},
		{
			"<leader>t3",
			"$a,<ESC>yyp$d0ci\""
		}
	},
}
