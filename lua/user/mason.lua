local M = {
  "williamboman/mason.nvim",
  commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "3d9e06ca604185ea5675d3c2ffd4284e0c2c7ffc",
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
