-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("catppuccin-mocha")
-- vim.cmd.colorscheme("tokyonight-day")
local time = os.date("*t")
if time.hour < 5 or time.hour > 17 then
	vim.g.tokyonight_style = "night"
	vim.cmd([[colorscheme tokyonight]])
else
	vim.g.tokyonight_style = "day"
	vim.cmd([[colorscheme tokyonight]])
end
