return {
	"letieu/graphql.nvim",
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
		}
	},
}
