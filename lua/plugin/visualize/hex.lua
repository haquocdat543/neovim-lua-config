return {
	"RaafatTurki/hex.nvim",
	keys = {
		{ "<leader>hd", ":%!xxd<CR> :set filetype=xxd<CR>", desc = "Hex: dump" },
		{ "<leader>ha", ":%!xxd -r<CR> :set filetype=<CR>", desc = "Hex: assemble" },

		-- { "<leader>hd", "<cmd>HexDump<CR>", desc = "Hex: dump" },
		-- { "<leader>ha", "<cmd>HexAssemble<CR>", desc = "Hex: assemble" },
		{ "<leader>ht", "<cmd>HexToggle<CR>", desc = "Hex: toggle" },
	},
	cmd = { "HexDump", "HexAssemble", "HexToggle" },
}
