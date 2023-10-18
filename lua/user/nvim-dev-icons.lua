local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  commit = "3af745113ea537f58c4b1573b64a429fefad9e07"
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
