-- Key mapping with anonymous function to run Prettier formatting
vim.api.nvim_set_keymap('n', '<leader>p', '', {
	noremap = true,
	silent = true,
	callback = function()
		vim.cmd('write')
		vim.lsp.buf.format({
			async = true,
			cmd = prettier.formatCommand,
			env = prettier.env,
		})
		vim.cmd('write')
	end
})
