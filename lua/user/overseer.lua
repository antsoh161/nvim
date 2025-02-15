return {
  "stevearc/overseer.nvim",
  dependencies = {
    "Civitasv/cmake-tools.nvim",
  },
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      strategy = "terminal",
      templates = {
        "builtin",
        "user.cpp_build",
        "user.cmake",
      },
      task_list = {
        direction = "right",
        bindings = {
          ["g?"] = "ShowHelp",
          ["<CR>"] = "false",
          ["e"] = "Edit",
          ["o"] = "RunAction",
          ["s"] = "OpenSplit",
          ["t"] = "OpenTab",
          ["f"] = "OpenFloat",
          ["<C-q>"] = "Close",
          ["p"] = "TogglePreview",
          ["<C-v>"] = "false",
          ["?"] = "false",
          ["<C-l>"] = "false",
          ["<C-h>"] = "false",
          ["L"] = "false",
          ["H"] = "false",
          ["["] = "false",
          ["]"] = "false",
          ["{"] = "false",
          ["}"] = "false",
          ["<C-k>"] = "false",
          ["<C-j>"] = "false",
          ["q"] = "false",
        },
      },
    })
  end,
}
