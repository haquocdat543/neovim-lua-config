return {
	"glepnir/lspsaga.nvim",
	keys = {
		{
			"<leader>K",
			vim.lsp.buf.hover,
			desc = "Hover documentation"
		},
		{
			"<leader>gr",
			vim.lsp.buf.references,
			desc = "Find references"
		},
		{
			"<leader>fc",
			function() vim.lsp.buf.format({ async = true }) end,
			desc = "Format code"
		},
		{ "<leader>lp", "<cmd>LspStop<cr>",                 desc = "Stop LSP" },
		{ "<leader>ls", "<cmd>LspStart<cr>",                desc = "Start LSP" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>",          desc = "Rename symbol" },
		{ "ca",         "<cmd>Lspsaga code_action<cr>",     desc = "Open code action" },
		{ "gd",         "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
		{ "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", desc = "Open peek definition" },
		{ "<leader>fd", "<cmd>Lspsaga finder<cr>",          desc = "Open finder" },
		{ "<leader>tt", "<cmd>Lspsaga term_toggle<cr>",     desc = "Open terminal" },
		{ "<leader>wt", "<cmd>Lspsaga winbar_toggle<cr>",   desc = "Toggle winbar" },
		{ "<leader>ol", "<cmd>Lspsaga outline<cr>",         desc = "Open outline" },
	},
	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

				vim.keymap.set("n", "<leader>fc", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format Code" })

				vim.keymap.set("n", "<leader>ab", function()
					local clients = vim.lsp.get_active_clients()
					if #clients == 0 then
						print("No active LSP clients")
						return
					end

					local capabilities = vim.inspect(clients[1].server_capabilities)

					-- Display in a floating window
					local buf = vim.api.nvim_create_buf(false, true)
					vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(capabilities, "\n"))

					local width = math.min(80, vim.o.columns - 4)
					local height = math.min(20, vim.o.lines - 4)

					local options = {
						relative = "editor",
						width = width,
						height = height,
						row = (vim.o.lines - height) / 2,
						col = (vim.o.columns - width) / 2,
						style = "minimal",
						border = "rounded",
					}

					vim.api.nvim_open_win(buf, true, options)
				end, { desc = "Show LSP Capabilities" })
			end,
		})
	end,
	config = function()
		-- import lspsaga safely
		local saga_status, saga = pcall(require, "lspsaga")
		if not saga_status then
			return
		end

		saga.setup({
			-- keybinds for navigation in lspsaga window
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
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
		vim.diagnostic.config({
			virtual_lines = true,
		})
	end,
}
