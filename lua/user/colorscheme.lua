-- This is the default colorscheme
return {
  "folke/tokyonight.nvim",
  commit = "633039585dff7fd2b9b62fb190bf768702609d95",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  name = "tokyonight-night",
  config = function()
    local status_ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
    if not status_ok then
      return
    end
  end
}
