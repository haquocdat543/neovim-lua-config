return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	opts = function()
		return {
			border = true,
			size = { w = 80, h = 80 }, -- use dynamic size
			mappings = {
				sidebar = nil,
				term = function(buf)
					vim.keymap.set({ "n", "t" }, "<C-,>", "<CMD>FloatermToggle<CR>", { buffer = buf })
				end,
			},
			terminals = {
				{ name = "Terminal" },
				{ name = "Terminal", cmd = "neofetch" },
				-- more terminals
			},
		}
	end,
	cmd = "FloatermToggle",
	keys = {
		{
			"<C-,>",
			"<CMD>FloatermToggle<CR>",
			{ desc = "Toggle float terminal" }
		},
	},
}
