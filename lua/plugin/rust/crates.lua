return {
	"saecki/crates.nvim",
	tag = "stable",
	event = { "BufRead Cargo.toml" },
	keys = {
		{ "<leader>r1", "<cmd>Crates show_features_popup<cr>", desc = "Open rust features popup" },
		{ "<leader>r2", "<cmd>Crates show_versions_popup<cr>", desc = "Open rust versions popup" },
		{ "<leader>r3", "<cmd>Crates show_dependencies_popup<cr>", desc = "Open rust dependencies popup" },
		{ "<leader>r4", "<cmd>Crates show_crate_popup<cr>", desc = "Open rust crate popup" },
	},
	config = function()
		require("crates").setup()
	end,
}
