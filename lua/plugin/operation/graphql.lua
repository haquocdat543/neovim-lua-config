return {
	"letieu/graphql.nvim",
	enabled = false,
	keys = {
		{
			"<leader>gg",
			function()
				require("graphql").open()
			end,
			desc = "graphql - Open",
		},
		{
			"<leader>gq",
			function()
				require("graphql").close()
			end,
		},
		{
			"<leader>R",
			function()
				require("graphql").run()
			end,
		},
	},
}
