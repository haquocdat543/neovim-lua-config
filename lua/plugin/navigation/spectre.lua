return {
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup({
			-- mapping = {
			-- ["tab"] = {
			-- map = "<Tab>",
			-- cmd = "<cmd>set wrap<CR><cmd>lua require('spectre').tab()<cr>",
			-- desc = "next query",
			-- },
			-- ["shift-tab"] = {
			-- map = "<S-Tab>",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').tab_shift()<cr>",
			-- desc = "previous query",
			-- },
			-- ["toggle_line"] = {
			-- map = "dd",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').toggle_line()<CR>",
			-- desc = "toggle item",
			-- },
			-- ["enter_file"] = {
			-- map = "<cr>",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').select_entry()<CR>",
			-- desc = "open file",
			-- },
			-- ["send_to_qf"] = {
			-- map = "<leader>q",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').send_to_qf()<CR>",
			-- desc = "send all items to quickfix",
			-- },
			-- ["replace_cmd"] = {
			-- map = "<leader>c",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').replace_cmd()<CR>",
			-- desc = "input replace command",
			-- },
			-- ["show_option_menu"] = {
			-- map = "<leader>o",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').show_options()<CR>",
			-- desc = "show options",
			-- },
			-- ["run_current_replace"] = {
			-- map = "<leader>rc",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').run_current_replace()<CR>",
			-- desc = "replace current line",
			-- },
			-- ["run_replace"] = {
			-- map = "<leader>R",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').run_replace()<CR>",
			-- desc = "replace all",
			-- },
			-- ["change_view_mode"] = {
			-- map = "<leader>v",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').change_view()<CR>",
			-- desc = "change result view mode",
			-- },
			-- ["change_replace_sed"] = {
			-- map = "trs",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').change_engine_replace('sed')<CR>",
			-- desc = "use sed to replace",
			-- },
			-- ["change_replace_oxi"] = {
			-- map = "tro",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
			-- desc = "use oxi to replace",
			-- },
			-- ["toggle_live_update"] = {
			-- map = "tu",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').toggle_live_update()<CR>",
			-- desc = "update when vim writes to file",
			-- },
			-- ["toggle_ignore_case"] = {
			-- map = "ti",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').change_options('ignore-case')<CR>",
			-- desc = "toggle ignore case",
			-- },
			-- ["toggle_ignore_hidden"] = {
			-- map = "th",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').change_options('hidden')<CR>",
			-- desc = "toggle search hidden",
			-- },
			-- ["resume_last_search"] = {
			-- map = "<leader>l",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre').resume_last_search()<CR>",
			-- desc = "repeat last search",
			-- },
			-- ["select_template"] = {
			-- map = "<leader>rp",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').select_template()<CR>",
			-- desc = "pick template",
			-- },
			-- ["delete_line"] = {
			-- map = "<leader>rd",
			-- cmd = "<cmd>set nopaste<CR><cmd>set wrap<CR><cmd>lua require('spectre.actions').run_delete_line()<CR>",
			-- desc = "delete line",
			-- },
			-- you can put your mapping here it only
			-- },
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
			replace_vim_cmd = nil,
			open_template = {
				-- Bech32 address
				{
					search_text = "(?<![a-zA-Z0-9])(cosmos|agoric|osmo|juno|atone|axelar|bbn)([a-z0-9]{16,})",
					replace_text = "",
					path = "",
				},
				-- p2pk
				{
					search_text = "(?:21(?:02|03)[0-9a-fA-F]{64}|41(?:04)[0-9a-fA-F]{128})ac",
					replace_text = "",
					path = "",
				},
				-- p2pkh
				{
					search_text = "76a914[0-9a-fA-F]{40}88ac",
					replace_text = "",
					path = "",
				},
				-- p2sh
				{
					search_text = "a914[0-9a-fA-F]{40}87",
					replace_text = "",
					path = "",
				},
				-- p2wpkh
				{
					search_text = "0014[0-9a-fA-F]{40}",
					replace_text = "",
					path = "",
				},
				-- p2wsh
				{
					search_text = "0020[0-9a-fA-F]{64}",
					replace_text = "",
					path = "",
				},
				-- p2tr
				{
					search_text = "5120[0-9a-fA-F]{64}",
					replace_text = "",
					path = "",
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
