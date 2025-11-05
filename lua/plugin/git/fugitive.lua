return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gb", "<cmd>Git blame<cr>",  desc = "Open git blame terminal" },
		{ "<leader>gs", "<cmd>G status<cr>",   desc = "Show status" },
		{ "<leader>ga", "<cmd>G add<cr>",      desc = "Git add" },
		{ "<leader>gA", "<cmd>G add .<cr>",    desc = "Git add all" },
		{ "<leader>gc", "<cmd>G commit<cr>",   desc = "Git commit" },
		{ "<leader>gb", "<cmd>G checkout<cr>", desc = "Git checkout" },
		{ "<leader>gB", "<cmd>G checkout -b ", desc = "Git create new branch" },
		{ "<leader>gp", "<cmd>G pull<cr>",     desc = "Git pull" },
		{ "<leader>gP", "<cmd>G push<cr>",     desc = "Git push" },
		{ "<leader>gl", "<cmd>G log<cr>",      desc = "Git log" },
		{ "<leader>gr", "<cmd>G reflog<cr>",   desc = "Git reflog" },
	}
}
