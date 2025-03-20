local luasnip = require("luasnip")
local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("make", {

	s("go", {
		t({
			"",
			"run:",
			"	go run main.go",
			"",
		})
	}),

})
