local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
	-- Print statement
	s("pr", {
		t("print("),
		i(1, '"Hello, world!"'),
		t(")"),
	}),

	-- For loop
	s("for", {
		t("for "),
		i(1, "i"),
		t(" = "),
		i(2, "1"),
		t(", "),
		i(3, "10"),
		t(" do"),
		t({ "", "    " }),
		i(4, "-- Your code here"),
		t({ "", "end" }),
	}),
}
