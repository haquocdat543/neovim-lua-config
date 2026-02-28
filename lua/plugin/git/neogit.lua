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
		"ibhagwan/fzf-lua",            -- optional
	},
	opts = {
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		disable_commit_confirmation = true,
		integrations = {
			telescope = true,
		},
		mappings = {
			rebase_editor = {
				["d"] = false,
				["D"] = "Drop",
				["p"] = false,
				["P"] = "Pick",
			},
		},
	},
	keys = {
		{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	},
}
