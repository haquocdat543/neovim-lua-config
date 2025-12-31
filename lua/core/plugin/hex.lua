local M = {}

-- per-buffer state
local state = {}

local function detach_lsp(buf)
	for _, client in pairs(vim.lsp.get_active_clients({ bufnr = buf })) do
		vim.lsp.buf_detach_client(buf, client.id)
	end
end

local function get_buf()
	return vim.api.nvim_get_current_buf()
end

local function write_if_modified()
	if vim.bo.modified then
		vim.cmd("write")
	end
end

function M.dump()
	local buf = get_buf()
	if state[buf] then
		return
	end

	-- save current buffer state
	state[buf] = {
		filetype = vim.bo.filetype,
	}

	-- DETACH LSP
	detach_lsp(buf)

	write_if_modified()

	-- binary-safe options
	vim.bo.binary = true
	vim.bo.endofline = false
	vim.bo.fixendofline = false

	vim.cmd("%!xxd")

	vim.bo.filetype = "xxd"
	state[buf].hex = true
end

function M.assemble()
	local buf = get_buf()
	local s = state[buf]
	if not s or not s.hex then
		return
	end

	write_if_modified()

	vim.cmd("%!xxd -r")

	-- restore filetype
	vim.bo.filetype = s.filetype or ""

	vim.cmd("write")

	vim.bo.binary = true

	state[buf] = nil

	-- re-edit to refresh buffer metadata
	vim.cmd("edit")
end

function M.toggle()
	local buf = get_buf()
	if state[buf] and state[buf].hex then
		M.assemble()
	else
		M.dump()
	end
end

function M.hextext_to_bytes()
	local buf = get_buf()
	if state[buf] then
		return
	end

	state[buf] = {
		filetype = vim.bo.filetype,
		mode = "hextext",
	}

	detach_lsp(buf)
	write_if_modified()

	vim.bo.binary = true
	vim.bo.endofline = false
	vim.bo.fixendofline = false

	-- ASCII hex → bytes → xxd dump
	vim.cmd("%!xxd -r -p | xxd")

	vim.bo.filetype = "xxd"
end

function M.bytes_to_hextext()
	local buf = get_buf()
	local s = state[buf]
	if not s or s.mode ~= "hextext" then
		return
	end

	write_if_modified()

	-- xxd dump → bytes → plain hex
	vim.cmd("%!xxd -r | xxd -p")

	vim.bo.filetype = s.filetype or "xxd-hextext"
	vim.cmd("write")

	state[buf] = nil
	vim.cmd("edit")
end

function M.toggle_hextext()
	local buf = get_buf()
	if state[buf] and state[buf].mode == "hextext" then
		M.bytes_to_hextext()
	else
		M.hextext_to_bytes()
	end
end

-- keymaps
vim.keymap.set("n", "<leader>hd", M.dump, { desc = "Hex: dump" })
vim.keymap.set("n", "<leader>ha", M.assemble, { desc = "Hex: assemble" })
vim.keymap.set("n", "<leader>ht", M.toggle, { desc = "Hex: toggle" })

vim.keymap.set("n", "<leader>hh", M.hextext_to_bytes, { desc = "HexText → bytes" })
vim.keymap.set("n", "<leader>hH", M.bytes_to_hextext, { desc = "Bytes → HexText" })
vim.keymap.set("n", "<leader>hT", M.toggle_hextext, { desc = "HexText toggle" })

return M
