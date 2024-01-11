local M = {
	"mfussenegger/nvim-dap",
	commit = "e154fdb6d70b3765d71f296e718b29d8b7026a63",
	event = "VeryLazy",
}

function M.config()
	local dap = require("dap")

	local dap_ui_status_ok, dapui = pcall(require, "dapui")
	if not dap_ui_status_ok then
		return
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

  dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7"
}

  dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

	-- dap.adapters.codelldb = {
	-- 	type = "server",
	-- 	port = "${port}",
	-- 	executable = {
	-- 		-- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
	-- 		command = "codelldb",
	-- 		args = { "--port", "${port}" },
	-- 		-- On windows you may have to uncomment this:
	-- 		-- detached = false,
	-- 	},
	-- }
	-- dap.configurations.c = {
	-- 	{
	-- 		name = "Launch file",
	-- 		type = "codelldb",
	-- 		request = "launch",
	-- 		program = function()
	-- 			local path
	-- 			vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
	-- 				path = input
	-- 			end)
	-- 			vim.cmd([[redraw]])
	-- 			return path
	-- 		end,
	-- 		cwd = "${workspaceFolder}",
	-- 		stopOnEntry = false,
	-- 	},
	-- }
 --  dap.configurations.cpp = {
	-- 	{
	-- 		name = "Launch file",
	-- 		type = "codelldb",
	-- 		request = "launch",
	-- 		program = function()
	-- 			local path
	-- 			vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
	-- 				path = input
	-- 			end)
	-- 			vim.cmd([[redraw]])
	-- 			return path
	-- 		end,
	-- 		cwd = "${workspaceFolder}",
	-- 		stopOnEntry = false,
 --      args = {},
 --      -- runInTerminal = true,
	-- 	},
	-- }
end

return M
