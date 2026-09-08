vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  columns = {
    -- "permissions",
    "size",
    -- "mtime",
    "icon",
  },
})
