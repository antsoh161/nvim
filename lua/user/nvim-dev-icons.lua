local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  commit = "cfc8824cc1db316a276b36517f093baccb8e799a"
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
