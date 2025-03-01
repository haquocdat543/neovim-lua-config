require('telescope').load_extension('projects')

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup {
	pickers = {
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end
		},
	},
}
