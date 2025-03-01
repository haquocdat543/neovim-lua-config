require("nvim-tree").setup({
	-- Automatically update the tree when changing directories
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_cwd = true,
	auto_reload_on_write = true,
	update_focused_file = {
		enable = true, -- Enable updating the focused file
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
	},
	filters = {
		dotfiles = false,
	},
})
