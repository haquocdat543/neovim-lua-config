return {
	"voldikss/vim-floaterm",
	config = function()
		vim.g.floaterm_position = "topright"
		vim.g.floaterm_width = 0.6
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_title = "Terminal $1/$2"
		vim.g.floaterm_wintype = "float"
		vim.g.floaterm_rootmarkers = { ".pro" }
	end,
	init = function()
		vim.keymap.set("n", "<leader>tt", ":terminal<CR>")
	end,
	keys = {
		{
			"<leader>ft",
			"<CMD>FloatermNew<CR>",
		},
	},
}
