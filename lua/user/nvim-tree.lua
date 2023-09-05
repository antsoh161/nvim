local M = {
  "kyazdani42/nvim-tree.lua",
  commit = "00741206c2df9c4b538055def19b99790f0c95c8",
  event = "VimEnter",
}

local my_root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t") .. "/.."
end


local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Hack for folder icons, will get removed if color scheme is changed
  vim.cmd "highlight NvimTreeFolderIcon guifg=#e0af68"
  -- Default keys 
  api.config.mappings.default_on_attach(bufnr)
  -- Custom keys
  local keymap = vim.keymap.set
  keymap('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  keymap('n', 'l', api.node.open.edit, opts('Open'))
  keymap('n', '<CR>', api.tree.change_root_to_node, opts('CD'))
end

function M.config()
  require("nvim-tree").setup({
    on_attach = on_attach,
    sync_root_with_cwd = false,
    update_focused_file = {
      enable = true,
      update_root = false,
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
      enable = false,
      show_on_dirs = false,
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
      enable = false,
      ignore = true,
    },
    filters = {
      dotfiles = true,
    },
  })
end

return M

