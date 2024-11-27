return {

   {
      "folke/tokyonight.nvim",
      priority = 1000, -- Load first
      lazy = false,
      name = "tokyonight-night",
      config = function()
         vim.cmd.colorscheme("tokyonight-night")
      end,
   },
   {
      "catppuccin/nvim",
      priority = 999,
      lazy = false,
      name = "catppuccin",
      config = function()
         require("catppuccin").setup({
            cmp = true,
            gitsigns = true,
            harpoon = false, -- Try out
            illuminate = false,
            indent_blanklune = {
               enabled = false,
               scope_color = "sapphire",
               colored_indent_levels = false,
            },
            mason = true,
            native_lsp = { enabled = true },
            notify = false,
            nvimtree = true,
            neotree = false, -- ?
            symbols_outline = false, -- ?
            telescope = true,
            treesitter = true,
            treesitter_context = true,
         })
         for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
         end
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
}
