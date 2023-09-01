-- disable netrw so it does not conflict with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.vscode then
  require "vscode"
  require "user.options"
else
  require "user.options"
  require "user.keymaps"
  require "user.lazy"
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
   -- require "user.nvim-rooter"
end
