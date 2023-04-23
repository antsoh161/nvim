-- This is the default colorscheme
-- set a new one with :colorscheme <scheme>

local colorscheme = "tokyonight-night"
-- local colorscheme = "darkplus"
-- local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
