local luasnip = require("luasnip")

local a = luasnip.add_snippets
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

a("html", {

	-- MathJax2 via CDN
	s("mathjax2", {
		t({
			"<script id=\"MathJax-script\" async src=\"https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js\"></script>",
		})
	}),

	-- MathJax via CDN
	s("mathjax", {
		t({
			"<script src=\"https://polyfill.io/v3/polyfill.min.js?features=es6\"></script>",
			"<script id=\"MathJax-script\" async src=\"https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js\"> </script>",
		})
	}),

	-- FontAwesome via CDN
	s("fontawesome", {
		t({
			"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">",
		})
	}),

	-- MaterialIcon via CDN
	s("mi", {
		t({
			"<link href=\"https://fonts.googleapis.com/css2?family=Material+Icons\" rel=\"stylesheet\">",
			"<link href=\"https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined\" rel=\"stylesheet\">",
		})
	}),

	-- BoostrapIcon via CDN
	s("bi", {
		t({
			"<link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css\" rel=\"stylesheet\">",
		})
	}),

	-- FeatherIcon via CDN
	s("fi", {
		t({
			"<script src=\"https://unpkg.com/feather-icons\"></script>",
		})
	}),

	-- BulmaCSS via CDN
	s("bulma", {
		t({
			"<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css\">",
		})
	}),

	-- Google font via CDN
	s("google-font", {
		t({
			"<link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap\" rel=\"stylesheet\">",
		})
	}),

	-- ReactJS via CDN
	s("reactjs", {
		t({
			"<script crossorigin src=\"https://unpkg.com/react@18/umd/react.development.js\"></script>",
			"<script crossorigin src=\"https://unpkg.com/react-dom@18/umd/react-dom.development.js\"></script>",
		})
	}),

	-- AngularJS via CDN
	s("vuejs", {
		t({
			"<script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js\"></script>",
		})
	}),

	-- VueJS via CDN
	s("vuejs", {
		t({
			"<script src=\"https://unpkg.com/vue@3/dist/vue.global.js\"></script>",
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
