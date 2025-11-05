return {
	"glepnir/lspsaga.nvim",
	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
				vim.keymap.set("n", "<leader>lp", ":LspStop<CR>")
				vim.keymap.set("n", "<leader>ls", ":LspStart<CR>")
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
				vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", { desc = "Rename Symbol" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
				vim.keymap.set("n", "ca", ":Lspsaga code_action<CR>")
				vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>")
				vim.keymap.set("n", "<leader>pd", ":Lspsaga peek_definition<CR>")
				vim.keymap.set("n", "<leader>fd", ":Lspsaga finder<CR>")
				vim.keymap.set("n", "<leader>sd", ":Lspsaga show_buf_diagnostics<CR>")
				vim.keymap.set("n", "<leader>ol", ":Lspsaga outline<CR>")
				vim.keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>")
				vim.keymap.set("n", "<leader>wt", ":Lspsaga winbar_toggle<CR>")
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
