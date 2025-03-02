require("telescope").load_extension("projects")

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next, -- Move down
				["<C-k>"] = actions.move_selection_previous, -- Move up
				["<C-n>"] = false, -- Disable default <C-n>
				["<C-p>"] = false, -- Disable default <C-p>
			},
			n = {
				["q"] = actions.close, -- Quit with 'q' in normal mode
			},
		},
	},
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
})
