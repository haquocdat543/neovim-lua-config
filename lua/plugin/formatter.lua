-- shfmt configuration for Bash
local shfmt = {
	formatCommand = "shfmt -i 2 -ci -s",
	formatStdin = true
}

-- gofmt configuration for Go
local gofmt = {
	formatCommand = "gofmt",
	formatStdin = true
}

-- rustfmt configuration for Rust
local rustfmt = {
	formatCommand = "rustfmt",
	formatStdin = true
}

-- Prettier configuration
local prettier = {
	formatCommand = 'prettierd "${INPUT}"',
	formatStdin = true,
	env = {
		string.format('PRETTIERD_DEFAULT_CONFIG=%s',
			vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
	},
}
