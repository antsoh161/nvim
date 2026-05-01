return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",

    config = function()
      local dap = require("dap")

      dap.adapters = require("config.dap_settings.adapters")

      local cpp_configs = require("config.dap_settings.cpp")
      dap.configurations.c = cpp_configs
      dap.configurations.cpp = cpp_configs

      dap.configurations.rust = require("config.dap_settings.rust")

      dap.configurations.python = require("config.dap_settings.python")

      dap.configurations.sh = require("config.dap_settings.bash")
      dap.configurations.bash = dap.configurations.sh

      -- Load .vscode/launch.json if present (per-project presets)
      local vscode = require("dap.ext.vscode")
      vscode.type_to_filetypes = {
        cppdbg = { "c", "cpp" },
        codelldb = { "c", "cpp", "rust" },
        lldb = { "c", "cpp", "rust" },
        python = { "python" },
        ["bash-debug"] = { "sh", "bash" },
      }

      vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapStopped",
        { text = "→", texthl = "DiagnosticSignOk", linehl = "DapStoppedLine", numhl = "" }
      )
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })

      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#304030" })
    end,
  },
   {
      "igorlfs/nvim-dap-view",
      lazy = false,
      opts = {}
   },
}
