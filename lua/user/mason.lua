local M = {
  "williamboman/mason.nvim",
  commit = "0942198fb9a998b6ccee36fb8dd7495eb8ba659c",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "dfdd771b792fbb4bad8e057d72558255695aa1a7",
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
