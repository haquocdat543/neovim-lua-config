return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			return
		end

		-- get lualine nightfly theme
		local lualine_nightfly = require("lualine.themes.catppuccin")

		-- new colors for theme
		local new_colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			black = "#000000",
		}

		-- change nightlfy theme colors
		-- lualine_nightfly.normal.a.bg = new_colors.blue
		-- lualine_nightfly.insert.a.bg = new_colors.green
		-- lualine_nightfly.visual.a.bg = new_colors.violet
		lualine_nightfly.command = {
			a = {
				gui = "bold",
				bg = new_colors.yellow,
				fg = new_colors.black, -- black
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				-- theme = "gruvbox",
				-- theme = "catppuccin",
				-- theme = "tokyonight",
				theme = "auto",
				globalstatus = true,
			},
			sections = {},
			tabline = {},
			winbar = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						function()
							local git_dir = vim.fs.find(".git", { upward = true })[1]
							if not git_dir then
								return ""
							end

							local git_root = vim.fs.dirname(git_dir)
							local git_name = vim.fn.fnamemodify(git_root, ":t")

							local file_dir = vim.fn.expand("%:p:h")

							if file_dir == git_root then
								return git_name
							end

							local relative = file_dir:sub(#git_root + 2)

							return git_name .. "/" .. relative
						end,
					}
					,
					"filename", "diagnostics"
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location", {
					"datetime",
					style = "%H:%M",
				} },
			},
		})
	end,
}
