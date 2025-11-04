-- Enable concealment for markdown files
vim.api.nvim_create_autocmd("VimEnter", {
	group = "TestBufEnterCondition",
	callback = function()
		-- Open NvimTree
		vim.cmd("NvimTreeOpen")
		vim.cmd("wincmd w")
	end,
})
