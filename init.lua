if vim.g.vscode then
  require "vscode"
  require "user.options"
else
  require "user.impatient"
  require "user.options"
  require "user.keymaps"
  require "user.plugins"
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