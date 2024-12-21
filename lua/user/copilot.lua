return {
   {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      event = "InsertEnter",
      opts = {
         suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
         },
         panel = {
            enabled = false,
         },
      },
      config = function(opts)
         require("copilot").setup(opts)
      end,
   },
   {
      "CopilotC-Nvim/CopilotChat.nvim",
      build = "make tiktoken",
      config = function()
         require("CopilotChat").setup({
            mappings = {
               reset = {
                  normal = '',
                  insert = '',
               },
            },
         })
      end,
   },
}
