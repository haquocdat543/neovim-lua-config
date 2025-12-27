return {
	"rest-nvim/rest.nvim",
	enabled = true,
	config = function()
		require("rest-nvim").setup({
			response = {
				hooks = {
					decode_url = true,
					format = true,
				},
			},
			ui = {
				winbar = true,
			},
		})
	end,
	keys = {
		{
			"<leader>rr",
			"<CMD>Rest run<CR>",
			desc = "Run RestfulAPI under cursor",
		},
		{
			"<leader>rc",
			"<C-w>h<C-w>c",
			desc = "Close left window",
		},
	},
}
