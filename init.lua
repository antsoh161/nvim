-- disable netrw so it does not conflict with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.vscode then
  require "vscode"
  require "user.options"
else
  require "user.options"
  require "user.keymaps"
  require "user.lazy"  -- Don't set up any plugin before lazy
  require "user.mason" -- Should be set up before user.lsp and user.dap
  require "user.autocommands"
  require "user.colorscheme"
  require "user.cmp"
  require "user.telescope"
  require "user.gitsigns"
  require "user.treesitter"
  require "user.autopairs"
  require "user.comment"
  require "user.nvim-tree"
  require "user.bufferline"
  require "user.lualine"
  require "user.toggleterm"
  require "user.project"
  require "user.illuminate"
  require "user.indentline"
  require "user.alpha"
  require "user.lsp"
  require "user.dap"
  require "user.scope"
end
