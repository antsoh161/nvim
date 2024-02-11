local M = {

  "nvim-tree/nvim-web-devicons",
  commit = "313d9e7", -- TODO: remove when breaking is fixed..
  event = "VeryLazy",
}

function M.config()
  require("nvim-web-devicons").setup {
  }
end

return M
