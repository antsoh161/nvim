vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvimtools/none-ls.nvim",
})

-- none-ls.nvim keeps the `null-ls` module name for compatibility.
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    }),
    formatting.stylua,
  },
})
