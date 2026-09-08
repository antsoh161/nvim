return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
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
    })
  end,
}
