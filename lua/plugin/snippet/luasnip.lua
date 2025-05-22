return {
	"L3MON4D3/LuaSnip",
	config = function()
		local luasnip = require("luasnip")

		-- Set up LuaSnip
		luasnip.config.setup({
			history = true,                         -- Keep track of snippet history
			updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
		})

		-- Load all snippets
		-- Golang
		require("plugin.snippet.luasnip.go")

		-- Web
		require("plugin.snippet.luasnip.html")
		require("plugin.snippet.luasnip.css")

		-- Makefile
		require("plugin.snippet.luasnip.make")

		-- Keybindings for LuaSnip
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true })
	end,
}
