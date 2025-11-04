return {
	"nvimdev/dashboard-nvim",
	enabled = false,
	event = "VimEnter",
	config = function()
		require("dashboard").setup({})
	end,
}
