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
