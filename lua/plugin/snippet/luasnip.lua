return {
	"L3MON4D3/LuaSnip",
	config = function()
		local luasnip = require("luasnip")
		local s = luasnip.snippet
		local t = luasnip.text_node
		local i = luasnip.insert_node

		-- Set up LuaSnip
		luasnip.config.setup({
			history = true,                            -- Keep track of snippet history
			updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
		})

		-- Custom Go snippets
		luasnip.add_snippets("go", {
			s("check", {
				t({ "func check(e error) {",
					"    if e != nil {",
					"        panic(e)",
					"    }",
					"}" })
			}),
		})

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
