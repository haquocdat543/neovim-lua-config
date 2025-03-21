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

	s("readfile", {
		t({
			"",
			"data, err := os.ReadFile(",
		}),
		i(1, "\"filename.txt\""), -- Insert node for filename
		t({
			")",
			"if err != nil {",
			"	fmt.Println(\"Error reading file:\", err)",
			"	return",
			"}",
			"",
		})
	}),

})
