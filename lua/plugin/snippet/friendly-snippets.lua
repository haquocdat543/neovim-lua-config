return {
	"rafamadriz/friendly-snippets",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load() -- Optional: Load friendly-snippets
	end,
}
