return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function(opts)
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          keymap = {
            accept = "<C-a>",
            accept_word = false,
            accept_line = false,
            dismiss = "<C-n>",
          },
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup({
        model = "claude-3.7-sonnet",
        mappings = {
          reset = {
            normal = "",
            insert = "",
          },
        },
      })
    end,
  },
}
