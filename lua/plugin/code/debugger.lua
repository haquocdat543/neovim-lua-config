return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui", -- UI for DAP
		"leoluz/nvim-dap-go", -- DAP for Go
		"nvim-neotest/nvim-nio",
	},
	init = function()
		vim.keymap.set("n", "<leader>dc", function()
			require("dap").continue()
		end)
		vim.keymap.set("n", "<leader>sv", function()
			require("dap").step_over()
		end)
		vim.keymap.set("n", "<leader>si", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<leader>so", function()
			require("dap").step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end)
		vim.keymap.set("n", "<Leader>du", function()
			require("dapui").toggle()
		end)
		vim.keymap.set("n", "<Leader>du", function()
			require("dapui").toggle()
		end)
		vim.keymap.set("n", "<leader>fm", ":Format<CR>")
	end,
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dap-go").setup()

		dapui.setup()

		-- Open UI when debugging starts
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-- Close UI when debugging stops
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
