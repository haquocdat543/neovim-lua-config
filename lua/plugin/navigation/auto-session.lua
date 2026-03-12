return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	config = function()
		require("auto-session").setup({})
		vim.keymap.set("n", "<leader>sr", ":AutoSession restore<CR>", { desc = "Session Restore" })
		vim.keymap.set("n", "<leader>sh", ":AutoSession search<CR>", { desc = "Session Search" })
		vim.keymap.set("n", "<leader>ss", ":AutoSession save<CR>", { desc = "Session Save" })
	end
}
