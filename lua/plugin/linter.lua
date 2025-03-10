return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		-- Define linters for specific languages
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			python = { "flake8" },
			sh = { "shellcheck" },
			lua = { "luacheck" },
			go = { "golangci-lint" },
		}
	end,
}
