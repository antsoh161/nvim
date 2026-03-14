return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",

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
      ignore_install = { "" },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { "css" },
      },
      indent = { enable = true, disable = { "css" } },
    })
  end,
}
