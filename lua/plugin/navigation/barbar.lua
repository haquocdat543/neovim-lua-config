return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",   -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		require("barbar").setup({
			animation = false,

			icons = {
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
			},
		})

		----------------------------------------------------------------------------------------------------
		-- BarBar
		----------------------------------------------------------------------------------------------------
		-- Move to previous/next
		vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
		vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>")
		vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>")
		vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>")

		-- Re-order to previous/next
		vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
		vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
		vim.keymap.set("n", "<A-H", "<Cmd>BufferMovePrevious<CR>")
		vim.keymap.set("n", "<A-L", "<Cmd>BufferMoveNext<CR>")

		-- Goto buffer in position...
		vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
		vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
		vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
		vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
		vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
		vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
		vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
		vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
		vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
		vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

		-- Pin/unpin buffer
		vim.keymap.set("n", "<leader>k", "<Cmd>BufferPick<CR>")

		-- Goto pinned/unpinned buffer
		--                 :BufferGotoPinned
		--                 :BufferGotoUnpinned

		-- Close buffer
		vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")

		-- Wipeout buffer
		--                 :BufferWipeout

		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight

		-- Magic buffer-picking mode
		vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>")
		vim.keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>")

		-- Sort automatically by...
		vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
		vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>")
		vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
		vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
		vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")

		-- Other:
		-- :BarbarEnable - enables barbar (enabled by default)
		-- :BarbarDisable - very bad command, should never be used
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
