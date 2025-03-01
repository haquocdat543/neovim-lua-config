-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Lua formatter using stylua
		lua = { require("formatter.filetypes.lua").stylua },

		-- HCL formatter using hclfmt
		hcl = {
			function()
				return {
					exe = "hclfmt",
					stdin = true
				}
			end
		},

		-- YAML formatter using yamlfmt (uncomment if needed)
		-- yaml = { require("formatter.filetypes.yaml").yamlfmt },

		-- Default settings for all filetypes
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
			-- Alternative: require("formatter.filetypes.any").substitute_trailing_whitespace,
		},
	}
})
