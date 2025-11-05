return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		{
			"sindrets/diffview.nvim",
			opts = {
				keymaps = {
					view = {
						{ { "n", "v" }, "q", "<Cmd>DiffviewClose<CR>", { silent = true } },
					},
				},
			},
		},

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	opts = {
		integrations = {
			telescope = true,
		},
	},
	keys = {
		{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	},
}
