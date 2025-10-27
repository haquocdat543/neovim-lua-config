return {
	"magicmonty/sonicpi.nvim",
	config = function()
		require("sonicpi").setup()
	end,
	requires = {
		"hrsh7th/nvim-cmp",
		"kyazdani42/nvim-web-devicons",
	}
}
