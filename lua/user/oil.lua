return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      columns = {
        -- "permissions",
        "size",
        -- "mtime",
        "icon",
      },
    })
  end,
}
