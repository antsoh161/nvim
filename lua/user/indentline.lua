local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "9301e434dd41154ffe5c3d5b8a5c9acd075ebeff",
  event = "BufReadPre",
}
M.opts = {
  char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
  },
}

return M
