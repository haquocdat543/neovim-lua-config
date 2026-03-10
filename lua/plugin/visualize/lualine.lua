return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			return
		end

		-- get lualine nightfly theme
		local lualine_nightfly = require("lualine.themes.catppuccin")

		local colors = {
			bg       = '#202328',
			fg       = '#bbc2cf',
			yellow   = '#ECBE7B',
			cyan     = '#008080',
			darkblue = '#081633',
			green    = '#98be65',
			orange   = '#FF8800',
			violet   = '#a9a1e1',
			magenta  = '#c678dd',
			blue     = '#51afef',
			red      = '#ec5f67',
		}

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
		local config = {
			options = {
				-- theme = "gruvbox",
				-- theme = "catppuccin",
				-- theme = "tokyonight",
				theme = "auto",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						function()
							local file_path = vim.fn.expand("%:p")
							if file_path == "" then
								return ""
							end

							local file_dir = vim.fn.fnamemodify(file_path, ":h")
							local home = vim.fn.expand("~")

							-- Detect git root from current file (not cwd)
							local git_dir = vim.fs.find(".git", {
								path = file_dir,
								upward = true,
							})[1]

							-- Inside Git Repo
							if git_dir then
								local git_root = vim.fs.dirname(git_dir)
								local git_name = vim.fn.fnamemodify(git_root, ":t")

								if file_dir == git_root then
									return git_name
								end

								local relative = file_dir:sub(#git_root + 2)
								if relative and relative ~= "" then
									relative = relative:gsub("/", "  ")
									return git_name .. "  " .. relative
								else
									return git_name
								end
							end

							-- Not in Git, inside HOME
							if file_dir:sub(1, #home) == home then
								local relative = file_dir:sub(#home + 2)

								if relative == "" then
									return "~"
								end

								return "~  " .. relative:gsub("/", "  ")
							end

							-- Outside HOME → absolute
							return file_dir:gsub("/", "  ")
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
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand('%:p:h')
				local gitdir = vim.fn.finddir('.git', filepath .. ';')
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		-- local function ins_right(component)
		-- 	table.insert(config.sections.lualine_x, component)
		-- end
		--
		--

		ins_left {
			-- Lsp server name .
			function()
				local msg = 'No Active Lsp'
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				local X = ""
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						X = client.name .. "," .. X
					end
				end
				if not (X == "") then
					return X:sub(1, -2)
				else
					return msg
				end
			end,
			icon = ' LSP:',
			color = { fg = '#ffffff', gui = 'bold' },
		}

		lualine.setup(config)
	end,
}
