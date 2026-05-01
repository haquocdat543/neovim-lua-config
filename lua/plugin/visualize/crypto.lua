return {
	"gaborvecsei/cryptoprice.nvim",
	keys = {
		{
			"<leader>cp",
			function()
				require("cryptoprice").toggle()
			end,
			desc = "Show crypto prices",
		},
	},
	config = function()
		vim.g.cryptoprice_base_currency = "usd"
		vim.g.cryptoprice_crypto_list = { "bitcoin", "ethereum", "xaut", "xag", "crude" }
		vim.g.cryptoprice_window_width = 60
		vim.g.cryptoprice_window_height = 10
	end
}
