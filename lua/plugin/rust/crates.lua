return {
	"saecki/crates.nvim",
	tag = "stable",
	config = function()
		require("crates").setup()
		vim.api.nvim_create_autocmd(
			{
				"BufRead",
			},
			{
				pattern = "Cargo.toml",
				callback = function()
					vim.keymap.set("n", "<leader>r1", "<CMD>Crates show_features_popup<CR>", { desc = "Open rust features popup" })
					vim.keymap.set("n", "<leader>r2", "<CMD>Crates show_versions_popup<CR>", { desc = "Open rust versions popup" })
					vim.keymap.set("n", "<leader>r3", "<CMD>Crates show_crate_popup<CR>", { desc = "Open rust crate popup" })
					vim.keymap.set("n", "<leader>r4", "<CMD>Crates show_dependencies_popup<CR>",
						{ desc = "Open rust dependencies popup" })
				end,
			}
		)
	end,
}
