return {
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup({
			find_engine = {
				-- rg is map with finder_cmd
				["rg"] = {
					cmd = "rg",
					-- default args
					args = {
						-- "--color=always",
						"--pcre2", -- lookbehind and lookahead
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					options = {
						["ignore-case"] = {
							value = "--ignore-case",
							icon = "[I]",
							desc = "ignore case",
						},
						["hidden"] = {
							value = "--hidden",
							desc = "hidden file",
							icon = "[H]",
						},
						-- you can put any rg search option you want here it can toggle with
						-- show_option function
					},
				},
			},
			replace_engine = {
				["sd"] = {
					cmd = "sd",
					options = {
						["ignore-case"] = {
							value = "-f i",
							icon = "[I]",
							desc = "ignore case",
						},
					},
				},
			},
			default = {
				find = {
					--pick one of item in find_engine
					cmd = "rg",
					options = { "ignore-case" },
				},
				replace = {
					--pick one of item in replace_engine
					cmd = "sd",
				},
			},
		})
	end,
	keys = {
		{
			"<leader>S",
			'<cmd>lua require("spectre").toggle()<CR>',
			desc = "Toggle Spectre",
		},
		{
			"<leader>sw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = "Search current word",
		},
		{
			"<leader>sw",
			'<esc><cmd>lua require("spectre").open_visual()<CR>',
			desc = "Search current word",
		},
		{
			"<leader>sp",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			desc = "Search current word",
		},
	},
}
