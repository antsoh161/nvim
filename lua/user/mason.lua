return {
   "williamboman/mason.nvim",
   cmd = "Mason",
   event = "BufReadPre",
   dependencies = {
      {
         "williamboman/mason-lspconfig.nvim",
      },
   },
   config = function()
      require("mason").setup({

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
      })
      require("mason-lspconfig").setup({
         ensure_installed = require("shared.lsp").lsp_servers,
         automatic_installation = true,
      })
   end,
}
