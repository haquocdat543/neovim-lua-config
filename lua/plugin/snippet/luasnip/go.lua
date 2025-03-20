local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
	-- Main function
	s("main", {
		t([[
      package main

      func main() {
    ]]),
		i(1, "// Your code here"),
		t([[
      }
    ]]),
	}),

	-- Struct definition
	s("struct", {
		t([[type ]]),
		i(1, "MyStruct"),
		t([[ struct {
    ]]),
		i(2, "Field1 string"),
		t([[
      }
    ]]),
	}),
}
