return {
   "stevearc/overseer.nvim",
   -- dependencies = {
   --    "mfussenegger/nvim-dap",
   -- },
   config = function()
      local overseer = require("overseer")
      overseer.setup({
         strategy = {
            "jobstart",
            preserve_output = true,
            use_terminal = false,
         },
         templates = {
            "builtin",
            "user.cpp_build",
         },
         task_list = {
            direction = "right",
         }
      })
   end,
}
