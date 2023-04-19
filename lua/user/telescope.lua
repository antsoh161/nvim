local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"
local utils = require "telescope.utils"
-- local previewers = require "telescope.previewers"

-- local _bad = { ".*%.csv", ".*%.lua" } -- Put all filetypes that slow you down in this array
-- local bad_files = function(filepath)
--   for _, v in ipairs(_bad) do
--     if filepath:match(v) then
--       return false
--     end
--   end
--
--   return true
-- end
--
-- local new_maker = function(filepath, bufnr, opts)
--   opts = opts or {}
--   if opts.use_ft_detect == nil then opts.use_ft_detect = true end
--   opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
--   previewers.buffer_previewer_maker(filepath, bufnr, opts)
-- end


telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
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
  pickers = {
    find_files = {
      hidden = true,
      find_command = {
        'rg',
        '--files',
        '--color',
        'never',
      },
    },
  },
}
