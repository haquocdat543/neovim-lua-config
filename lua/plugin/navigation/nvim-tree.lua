return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			git = {
				enable = true, -- Disable Git integration
				ignore = false, -- Don't hide .gitignored files
			},
			-- Automatically update the tree when changing directories
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_cwd = true,
			auto_reload_on_write = true,
			update_focused_file = {
				enable = true,  -- Enable updating the focused file
				update_cwd = true, -- Change the root directory of the tree to the current file's directory
				update_root = true, -- Change the root directory of the tree to the current file's directory
				ignore_list = {}
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = true,
							color = true,
						},
					},
				}
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}
