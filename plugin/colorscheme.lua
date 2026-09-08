vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight-night" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" },
  { src = "https://github.com/rebelot/kanagawa.nvim", name = "kanagawa" },
  { src = "https://github.com/olimorris/onedarkpro.nvim", name = "onedarkpro" },
  { src = "https://github.com/nyoom-engineering/oxocarbon.nvim", name = "oxocarbon" },
})

-- The rest (tokyonight, oxocarbon) need no setup() call to just be
-- available as a `:colorscheme` option later.
require("gruvbox").setup()
require("kanagawa").setup()
require("onedarkpro").setup({
  colors = {
    red = "require('onedarkpro.helpers').lighten('red', 5, 'onedark_dark')",
  },
})

require("catppuccin").setup({
  color_overrides = {
    mocha = {
      base = "#000000",
      mantle = "#000000",
      crust = "#000000",
    },
  },
  integrations = {
    alpha = true,
    blink_cmp = true,
    cmp = false,
    gitsigns = true,
    fzf = true,
    fidget = true,
    harpoon = true,
    illuminate = false,
    indent_blanklune = {
      enabled = false,
      scope_color = "sapphire",
      colored_indent_levels = false,
    },
    mason = true,
    native_lsp = { enabled = true },
    notify = false,
    noice = true,
    nvimtree = false,
    neotree = false,
    overseer = true,
    lsp_trouble = true,
    symbols_outline = false,
    telescope = false,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
  },
})

vim.cmd.colorscheme("catppuccin-mocha")
