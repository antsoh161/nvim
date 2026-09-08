vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

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

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
