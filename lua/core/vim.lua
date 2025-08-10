-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[let g:UltiSnipsExpandTrigger="<tab>"]])
vim.cmd([[let g:UltiSnipsListSnippets="<c-y>"]])
vim.cmd([[let g:UltiSnipsJumpForwardTrigger="<CR>"]])
vim.cmd([[let g:UltiSnipsJumpBackwardTrigger="<C-n>n"]])
vim.cmd([[let g:UltiSnipsEditSplit="vertical"]])
vim.cmd([[let g:UltiSnipsSnippetDirectories=['~/snippet'] ]])
vim.cmd([[let g:floaterm_position = 'topright']])
vim.cmd([[let g:floaterm_width = 0.6]])
vim.cmd([[let g:floaterm_height = 0.8]])
vim.cmd([[let g:floaterm_title = 'Terminal $1/$2']])
vim.cmd([[let g:floaterm_wintype = 'float']])
vim.cmd([[let g:floaterm_rootmarkers = ['.pro'] ]])
vim.cmd([[let g:gitgutter_sign_added = '+' ]])
vim.cmd([[let g:gitgutter_sign_modified = '*' ]])
vim.cmd([[let g:gitgutter_sign_removed = 'x' ]])
vim.cmd([[let g:gitgutter_sign_removed_first_line = '^' ]])
vim.cmd([[let g:gitgutter_sign_modified_removed = '<' ]])
vim.cmd([[set viminfo='100,<1000000,s100000,h]])
vim.cmd([[autocmd FileType markdown let g:indentLine_enabled=0]])

vim.api.nvim_create_augroup("TestBufEnterCondition", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
	group = "TestBufEnterCondition",
	callback = function()
		-- Open NvimTree
		vim.cmd("NvimTreeOpen")
		vim.cmd("wincmd w")
	end,
})

-- Direct Lua highlight definitions
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#f4ca0d", ctermfg = "White" })

-- Enable concealment for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal conceallevel=0",
})
