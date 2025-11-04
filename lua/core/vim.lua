vim.g.gitgutter_sign_added = "+"
vim.g.gitgutter_sign_modified = "*"
vim.g.gitgutter_sign_removed = "x"
vim.g.gitgutter_sign_removed_first_line = "^"
vim.g.gitgutter_sign_modified_removed = "<"

-- Direct Lua highlight definitions
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#f4ca0d", ctermfg = "White" })
