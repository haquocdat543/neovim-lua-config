return {
	"kelly-lin/ranger.nvim",
	config = function()
		require("ranger-nvim").setup({
			replace_netrw = true,
			ui = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				height = 0.9,
				width = 0.9,
				x = 0.5,
				y = 0.5,
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>q", "", {
			noremap = true,
			callback = function()
				require("ranger-nvim").open(true)
			end,
		})
	end,
}
