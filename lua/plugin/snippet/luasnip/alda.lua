local luasnip = require("luasnip")
local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("alda", {

	s("piano", {
		t({
			"piano:",
			"  V1:",
			"    o4",
			"  V2:",
			"    o2",
		})
	}),
})
