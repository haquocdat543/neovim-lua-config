return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"LukasPietzschmann/telescope-tabs",
		"xiyaowong/telescope-emoji.nvim",
	},
	keys = {
		{
			"<leader>tl",
			function()
				vim.o.paste = false
				require("telescope").extensions.projects.projects()
			end,
			desc = "Open Telescope",
		},

		{
			"<leader>1",
			function()
				vim.o.paste = false
				require("telescope.builtin").find_files({
					hidden = true,
				})
			end,
			desc = "Find files",
		},

		{
			"<leader>2",
			function()
				vim.o.paste = false
				require("telescope.builtin").live_grep({
					additional_args = { "--hidden" },
				})
			end,
			desc = "Live grep",
		},

		{
			"<leader>3",
			function()
				vim.o.paste = false
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},

		{
			"<leader>4",
			function()
				vim.o.paste = false
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent files",
		},

		{
			"<leader>5",
			function()
				vim.o.paste = false
				require("telescope").extensions.projects.projects()
			end,
			desc = "Projects",
		},

		{
			"<leader>6",
			function()
				vim.o.paste = false
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "LSP Definitions",
		},

		{
			"<leader>7",
			function()
				vim.o.paste = false
				require("telescope.builtin").lsp_references()
			end,
			desc = "LSP References",
		},

		{
			"<leader>8",
			function()
				vim.o.paste = false
				require("telescope.builtin").lsp_implementations()
			end,
			desc = "LSP Implementations",
		},

		{
			"<leader>9",
			function()
				vim.o.paste = false
				require("telescope.builtin").git_status()
			end,
			desc = "Git status",
		},

		-- { "<leader>j", function() vim.o.paste = false require("telescope").extensions.emoji.emoji() end, desc = "Emoji Picker", },

		{
			"<leader>cs",
			function()
				vim.o.paste = false
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "Colorscheme picker",
		},
	},
	init = function() end,
	config = function()
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
						["<C-n>"] = false,                     -- Disable default <C-n>
						["<C-p>"] = false,                     -- Disable default <C-p>
						["<C-o>"] = actions.select_default,    -- Open with <C-o>
					},
					n = {
						["q"] = actions.close,    -- Quit with 'q' in normal mode
						["o"] = actions.select_default, -- Open with <C-o>
					},
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						".vscode",
						"--exclude",
						"dist",
						"--exclude",
						"build",
						"--exclude",
						"__pycache__",
						"--exclude",
						".venv",
					},
				},
				live_grep = {
					additional_args = function()
						return {
							"--hidden",
							"--glob",
							"!.git/*",
							"--glob",
							"!.vscode/*",
							"--glob",
							"!**/.venv/*",
							"--glob",
							"!**/__pycache__/*",
							"--glob",
							"!**/.cache/*",
							"--glob",
							"!**/.local/*",
							"--glob",
							"!**/node_modules/*",
						}
					end,
				},
			},
		})
		require("telescope").load_extension("projects")
		require("telescope").load_extension("emoji")
	end,
}
