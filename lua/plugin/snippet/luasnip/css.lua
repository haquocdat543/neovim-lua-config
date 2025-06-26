local luasnip = require("luasnip")

local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("css", {

	s("full", {
		t({
			"",
			"html,",
			"body {",
			"",
			"	position: fixed;",
			"",
			"	height: 100%;",
			"	width: 100%;",
			"",
			"	margin: 0;",
			"	padding: 0;",
			"",
			"}",
			"",
		})
	}),

	s("scrollable", {
		t({
			"body {",
			"",
			"  overflow: hidden;",
			"",
			"  height: 100vh;",
			"  width: 100vw;",
			"",
			"  margin: 0;",
			"  padding: 0;",
			"",
			"}",
			"",
			"#root {",
			"",
			"  position: fixed;",
			"",
			"  overflow-y: auto;",
			"",
			"  top: 0;",
			"",
			"  height: 100vh;",
			"  width: 100vw;",
			"",
			"  background-color: white;",
			"",
			"}",
		})
	}),

})
