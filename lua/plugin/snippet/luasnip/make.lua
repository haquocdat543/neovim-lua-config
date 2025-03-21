local luasnip = require("luasnip")
local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("make", {

	s("go", {
		t({
			"",
			"i-ginkgo:",
			"	go install github.com/onsi/ginkgo/v2/ginkgo@latest",
			"	go get github.com/onsi/gomega",
			"i-air:",
			"	go install github.com/air-verse/air@latest",
			"i-reflex:",
			"	go install github.com/cespare/reflex@latest",
			"",
			"air:",
			"	air",
			"reflex:",
			"	reflex -r '\\.go$$' -s -- go run main.go",
			"",
			"ginkgo-b:",
			"	ginkgo bootstrap",
			"ginkgo-w:",
			"	ginkgo watch",
			"",
		})
	}),

	s("rust", {
		t({
			"",
			"i-cw:",
			"	cargo install cargo-watch",
			"w-c:",
			"	cargo watch -x check",
			"w-b:",
			"	cargo watch -x build",
			"w-r:",
			"	cargo watch -x run",
			"",
		})
	}),

})
