local luasnip = require("luasnip")
local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("go", {

	s("check", {
		t({
			"",
			"func check(e error) {",
			"    if e != nil {",
			"        panic(e)",
			"    }",
			"}",
			"",
		})
	}),

})
