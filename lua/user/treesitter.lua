return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",

  config = function()
    require("nvim-treesitter")
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      modules = {},
      auto_install = false,
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
        "rust",
        "c",
        "cpp",
        "cmake",
        "yaml",
        "toml",
      },
      -- ensure_installed = "all", -- one of "all" or a list of languages
      ignore_install = { "" },
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      highlight = {
        enable = true,
        disable = { "css" },
      },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      indent = { enable = true, disable = { "css" } },
    })
  end,
}
