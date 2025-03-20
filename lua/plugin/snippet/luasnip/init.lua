local luasnip = require("luasnip")

-- Load snippets for each language/field
local snippets = {
	go = require("luasnip.go"),
	lua = require("luasnip.lua"),
	-- yaml = require("snippets.yaml"),
	-- k8s = require("snippets.k8s"),
	-- helm = require("snippets.helm"),
	-- docker = require("snippets.docker"),
	-- github_actions = require("snippets.github_actions"),
}

-- Add snippets to LuaSnip
for ft, snippets_table in pairs(snippets) do
	luasnip.add_snippets(ft, snippets_table)
end
