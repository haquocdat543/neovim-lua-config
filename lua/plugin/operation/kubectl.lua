return {
	"ramilito/kubectl.nvim",
	keys = {
		{
			"<leader>kk",
			'<cmd>lua require("kubectl").toggle()<CR>',
		},
	},
}
