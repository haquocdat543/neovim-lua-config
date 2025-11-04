-- AutoCommand

-- Dont enable indentline on markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.g.indentLine_enabled = 0
	end,
})

-- Enable concealment for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal conceallevel=0",
})

-- Remove - on jump
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
		"css",
		"scss",
		"less",
		"stylus",
		"sass",
		"php",
		"twig",
		"liquid",
		"markdown",
		"mdx",
		"json",
		"yaml",
		"toml",
		"xml",
		"svg",
	},
	callback = function()
		vim.opt_local.iskeyword:remove("-")
	end,
})

-- Rest Nvim
vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function(ev)
		vim.bo.formatexpr = ""
		vim.bo.formatprg = "jq"
		vim.bo[ev.buf].formatprg = "jq"
		print("It's a json file")
	end,
})
