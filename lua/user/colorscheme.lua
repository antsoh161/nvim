return {

  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight-night",
    config = function()
      -- vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000, -- Load first
    lazy = false,
    name = "catppuccin",
    config = function()
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
          harpoon = true, -- Try out
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
          neotree = false, -- ?
          overseer = true,
          lsp_trouble = true,
          symbols_outline = false, -- ?
          telescope = false,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      -- The fuck is this
      -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      -- 	vim.api.nvim_set_hl(0, group, {})
      -- end
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = true,
    event = "VeryLazy",
    config = true, -- Do this if you just want colorschemes available for later
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    event = "VeryLazy",
    lazy = true,
    config = true, -- Do this if you just want colorschemes available for later
  },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Load first
    lazy = false,
    -- event = "VeryLazy",
    config = function()
      require("onedarkpro").setup({
        colors = {
          red = "require('onedarkpro.helpers').lighten('red', 5, 'onedark_dark')",
        },
      })
      -- vim.cmd.colorscheme("onedark_dark")
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    priority = 1000, -- Load first
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme("oxocarbon")
    end,
  },
}
