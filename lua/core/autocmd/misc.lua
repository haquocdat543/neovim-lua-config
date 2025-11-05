-- Ltex LSP
vim.api.nvim_create_autocmd(
	{
		"BufRead",
		"BufReadPost",
		"BufNewFile",
		"BufWinEnter",
		"BufEnter",
		"BufWritePre",
		"BufWritePost",
	},
	{
		pattern = "*.md",
		callback = function()
			vim.cmd("LspStop ltex")
		end,
	}
)
