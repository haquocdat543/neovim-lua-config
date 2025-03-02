require("navigator").setup({
	debug = false,
	mason = true,
	lsp = {
		enable = true,
		hover = {
			enable = true,
			-- fallback when hover failed
			-- e.g. if filetype is go, try godoc
			go = function()
				local w = vim.fn.expand("<cWORD>")
				vim.cmd("GoDoc " .. w)
			end,
			-- if python, do python doc
			python = function()
				-- run pydoc, behaviours defined in lua/navigator.lua
			end,
			default = function()
				-- fallback apply to all file types not been specified above
				-- local w = vim.fn.expand('<cWORD>')
				-- vim.lsp.buf.workspace_symbol(w)
			end,
		},
		servers = {},
	},
})
