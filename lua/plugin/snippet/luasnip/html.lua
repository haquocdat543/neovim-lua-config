local luasnip = require("luasnip")

local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("html", {

	-- Google font via CDN
	s("google-font", {
		t({
		"<link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap\" rel=\"stylesheet\">",
		})
	}),

	-- TailwindCSS via CDN
	s("tailwindcss", {
		t({
		"<script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>",
		})
	}),

	-- Jquery via CDN
	s("jquery", {
		t({
		"<script src=\"https://code.jquery.com/jquery-3.5.1.min.js\" integrity=\"sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=\" crossorigin=\"anonymous\"></script>",
		})
	}),

	-- Boostrap via CDN
	s("bootstrap", {
		t({
		"<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx\" crossorigin=\"anonymous\"></script>",
		})
	}),

})
