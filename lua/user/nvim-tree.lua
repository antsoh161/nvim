local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local my_root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t") .. "/.."
end

-- Hack for folder icons, will get removed if color scheme is changed
vim.cmd "highlight NvimTreeFolderIcon guifg=#e0af68"

nvim_tree.setup {
  sync_root_with_cwd = true,
  -- respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    root_folder_label = my_root_folder_label,
    full_name = true,
    indent_width = 1,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 35,
    side = "left",
    -- adaptive_size = true,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "g", cb = tree_cb "cd" },
      },
    },
  },
  git = {
    ignore = true,
  },
  filters = {
    dotfiles = true,
  },
}
