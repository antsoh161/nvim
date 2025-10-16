return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  build = ":MasonUpdate",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- "hrsh7th/cmp-nvim-lsp",
      "nvimtools/none-ls.nvim",
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
      ensure_installed = require("config.lsp").lsp_servers,
      automatic_installation = true,
    })
  end,
}
