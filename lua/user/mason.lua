local M = {
  "williamboman/mason.nvim",
  commit = "cd7835b15f5a4204fc37e0aa739347472121a54c",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
    },
  },
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}


function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup({
    ensure_installed = require("shared.lsp").lsp_servers, 
    automatic_installation = true,
  })
end

return M
