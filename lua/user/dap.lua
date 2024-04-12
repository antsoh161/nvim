return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dap.ext.vscode").json_decode = require("overseer.json").decode

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			require("dap.ext.vscode").load_launchjs(nil)
			dap.adapters = require("shared.dap_settings.adapters") -- Add adapters into this table as needed

			dap.configurations.cpp = {}
			local cpp_configs = require("shared.dap_settings.cpp")
			for _, cpp_config in ipairs(cpp_configs) do
				table.insert(dap.configurations.cpp, cpp_config)
			end

			dap.configurations.python = {}
			local python_configs = require("shared.dap_settings.python")
			for _, python_config in ipairs(python_configs) do
				table.insert(dap.configurations.python, python_config)
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				event = "VeryLazy",
			},
			{
				"nvim-neotest/nvim-nio",
				event = "VeryLazy",
			},
		},

		config = function()
			require("dapui").setup({
				force_buffers = true,
				expand_lines = true,
				icons = { expanded = "", collapsed = "", circular = "" },
				mappings = {
					-- Use a table to apply multiple mappings
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.33 },
							{ id = "breakpoints", size = 0.17 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 0.33,
						position = "right",
					},
					{
						elements = {
							{ id = "repl", size = 0.45 },
							{ id = "console", size = 0.55 },
						},
						size = 0.27,
						position = "bottom",
					},
				},
				floating = {
					max_height = 0.9,
					max_width = 0.5, -- Floats will be treated as percentage of your screen.
					border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
			})

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
			)
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	{
		"rcarriga/cmp-dap",
		event = "VeryLazy",
		config = function() end,
	},
}
