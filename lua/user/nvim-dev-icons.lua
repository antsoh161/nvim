local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  commit = "cdbcca210cf3655aa9b31ebf2422763ecd85ee5c"
}

function M.config()
  require("nvim-web-devicons").setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
  }
end

return M
