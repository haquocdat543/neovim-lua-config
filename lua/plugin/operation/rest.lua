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
		vim.api.nvim_create_autocmd(
			{
				"BufRead",
			},
			{
				pattern = "*.http",
				callback = function()
					vim.keymap.set("n", "<leader>rr", "<CMD>Rest run<CR>", { desc = "Run RestfulAPI under cursor" })
					vim.keymap.set("n", "<leader>rc", "<C-w>h<C-w>c", { desc = "Close left window" })
				end,
			}
		)
	end,
}
