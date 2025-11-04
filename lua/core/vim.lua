vim.g.floaterm_position = "topright"
vim.g.floaterm_width = 0.6
vim.g.floaterm_height = 0.8
vim.g.floaterm_title = "Terminal $1/$2"
vim.g.floaterm_wintype = "float"
vim.g.floaterm_rootmarkers = { ".pro" }
vim.g.gitgutter_sign_added = "+"
vim.g.gitgutter_sign_modified = "*"
vim.g.gitgutter_sign_removed = "x"
vim.g.gitgutter_sign_removed_first_line = "^"
vim.g.gitgutter_sign_modified_removed = "<"
vim.opt.viminfo = "'100,<1000000,s100000,h"

-- Direct Lua highlight definitions
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#f4ca0d", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#9d7cd8", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#7dcfff", ctermfg = "White" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#f4ca0d", ctermfg = "White" })
