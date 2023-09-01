local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local my_root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t") .. "/.."
end

-- Hack for folder icons, will get removed if color scheme is changed
vim.cmd "highlight NvimTreeFolderIcon guifg=#e0af68"

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- Nvim tree keymaps
  local keymap = vim.keymap.set
  keymap('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  keymap('n', 'l', api.node.open.edit, opts('Open'))
  keymap('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
end

nvim_tree.setup({
  on_attach = my_on_attach,
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
  },
  git = {
    ignore = true,
  },
  filters = {
    dotfiles = true,
  },
})
