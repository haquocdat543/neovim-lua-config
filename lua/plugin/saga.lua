-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local on_attach = function(client, bufnr)
	opts.buffer = bufnr
	keymap.set("n", "gs", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
	keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "gn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "gp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "gP", "<Cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, ",ca", vim.lsp.buf.code_action, opts)
	opts.desc = "Smart rename"
	keymap.set("n", ",rn", vim.lsp.buf.rename, opts)
	opts.desc = "Show buffer diagnostics"
	keymap.set("n", ",D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
	opts.desc = "Show line diagnostics"
	keymap.set("n", ",d", vim.diagnostic.open_float, opts)
	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	opts.desc = "Restart LSP"
	keymap.set("n", ",rs", ":LspRestart<CR>", opts)
end
