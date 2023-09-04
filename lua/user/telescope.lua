local M = {
  "nvim-telescope/telescope.nvim",
  commit = "2c1ed33a6f6f2db3b69f5421f6b405eda1b07748",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    }
  },
}

function M.config()
  local actions = require("telescope.actions")
  local layout = require("telescope.actions.layout")
  require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/", "node_modules" },

    preview = {
      hide_on_startup = true,
    },
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = layout.toggle_preview,
      },
    },
  },
  -- pickers = {
    -- find_files = {
    --   hidden = true,
    --   find_command = {
    --     'rg',
    --     '--files',
    --     '--color',
    --     'never',
    --   },
    -- },
  -- },
  })
end

return M
