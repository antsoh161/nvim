return {
   "Civitasv/cmake-tools.nvim",
   dependencies = {
      {
         "nvim-lua/plenary.nvim",
      },
   },
   config = function()
      require("cmake-tools").setup({
         cmake_regenerate_on_save = false,
         cmake_executor = {
            name = "overseer",
            opts = {
               new_task_opts = {
                  strategy = {
                     "jobstart",
                  },
               },
               on_new_task = function()
                  require("overseer").open({ enter = false, direction = "right" })
               end,
            },
         },
         cmake_runner = {
            name = "overseer",
            opts = {
               new_task_opts = {
                  strategy = {
                     "jobstart",
                  },
               },
            },
         },
      })
   end,
}
