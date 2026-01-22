return {
	"phaazon/hop.nvim",
	enabled = true,
	config = function()
		require("hop").setup()
	end,
	keys = {
		{
			"<leader><leader>g",
			"<CMD>HopAnywhere<CR>",
		},
		{
			"<leader>j",
			"<CMD>HopWord<CR>",
		},
		{
			"<leader><leader>l",
			"<CMD>HopLine<CR>",
		},
		{
			"<leader><leader>c",
			"<CMD>HopChar1<CR>",
		},
	},
}
