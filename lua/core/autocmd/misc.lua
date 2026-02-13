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

-- ENV
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
		pattern = ".env",
		callback = function()
			vim.cmd("LspStop")
		end,
	}
)
