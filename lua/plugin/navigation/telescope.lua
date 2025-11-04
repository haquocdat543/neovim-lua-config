return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"LukasPietzschmann/telescope-tabs",
		"xiyaowong/telescope-emoji.nvim",
	},
	init = function()
		vim.keymap.set("n", "<leader>tl", ":set nopaste<CR>:Telescope<CR>")
		vim.keymap.set("n", "<leader>1", ":set nopaste<CR><Cmd>Telescope find_files hidden=true no_ignore=true<CR>")
		vim.keymap.set("n", "<leader>2", ":set nopaste<CR><Cmd>Telescope live_grep hidden=true no_ignore=true<CR>")
		vim.keymap.set("n", "<leader>3", ":set nopaste<CR><Cmd>Telescope buffers hidden=true no_ignore=true<CR>")
		vim.keymap.set("n", "<leader>4", ":set nopaste<CR><Cmd>Telescope oldfiles hidden=true no_ignore=true<CR>")
		vim.keymap.set("n", "<leader>5", ":set nopaste<CR><Cmd>Telescope projects<CR>")
		vim.keymap.set("n", "<leader>6", ":set nopaste<CR><Cmd>Telescope lsp_definitions<CR>")
		vim.keymap.set("n", "<leader>7", ":set nopaste<CR><Cmd>Telescope lsp_references<CR>")
		vim.keymap.set("n", "<leader>8", ":set nopaste<CR><Cmd>Telescope lsp_implementations<CR>")
		vim.keymap.set("n", "<leader>9", ":set nopaste<CR><Cmd>Telescope git_status<CR>")

		-- Colorscheme
		vim.keymap.set("n", "<leader>cs", function()
			require("telescope.builtin").colorscheme({ enable_preview = true })
		end)

		-- Extension
		vim.keymap.set("n", "<leader>j", ":set nopaste<CR><Cmd>Telescope emoji<CR>")
	end,
	config = function()
		require("telescope").load_extension("projects")
		require("telescope").load_extension("emoji")

		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			return
		end

		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"%.terragrunt%-cache/",
					"node_modules/",
					"%.terraform/",
					"%.vscode/",
					"out/",
					"dist/",
					"build/",
					"target/",
					"%.git/",
					"__pycache__/",
					"%.venv/",
					"%.keras/",
					"%.h5$",
					"dataset/",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next, -- Move down
						["<C-k>"] = actions.move_selection_previous, -- Move up
						["<C-n>"] = false, -- Disable default <C-n>
						["<C-p>"] = false, -- Disable default <C-p>
						["<C-o>"] = actions.select_default, -- Open with <C-o>
					},
					n = {
						["q"] = actions.close, -- Quit with 'q' in normal mode
						["o"] = actions.select_default, -- Open with <C-o>
					},
				},
			},
			pickers = {
				-- live_grep = {
				-- additional_args = function(opts)
				-- return { "--hidden" }
				-- end,
				-- },
			},
		})
	end,
}
