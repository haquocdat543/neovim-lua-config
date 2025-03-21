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

	s("writefile", {
		t({
			"",
			"content := []byte(",
		}),
		i(1, "\"Hello, Go!\""), -- Insert node for file content
		t({ ")",
			"err := os.WriteFile(",
		}),
		i(2, "\"example.txt\""), -- Insert node for filename
		t({ ", content, 0644)",
			"if err != nil {",
			"	fmt.Println(\"Error writing file:\", err)",
			"}",
			"",
		})
	}),

	s("gjson", {
		t({
			"",
		}),
		i(1,
			"value"),
		t({
			" := gjson.Get(",
		}),
		i(2, "json"),
		t({
			",",
		}),
		i(3, "\"name.last\""),
		t({ ")", }),
	}),

	s("marshal", {
		t({
			""
		}),
		i(1, "jsonData"),
		t({
			", err := json.Marshal("
		}),
		i(2, "struct"),
		t({
			")",
			"if err != nil {",
			"  fmt.Println(err)",
			"  return",
			"}",
			"",
		}),
	}),

	s("unmarshal", {
		t({
"json.Unmarshal([]byte(",
		}),
		i(1, "jsonStr"),
		t({
			"), &"
		}),
		i(2, "structName"),
		t({
			")",
			""
		}),
	})

})
