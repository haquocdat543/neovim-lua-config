require('telescope').load_extension('projects')

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
