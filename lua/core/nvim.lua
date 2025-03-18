-- Autocommand to format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false }) -- Use async = false to ensure formatting completes before saving
	end,
})
