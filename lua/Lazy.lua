-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

-- Install every plugin in user/
require("lazy").setup("user", {
  install = { colorscheme = { require("user.colorscheme").name } },
  default = { lazy = false, version = "2a9354c7d2368d78cbd5575a51a2af5bd8a6ad01" },
  ui = { wrap = "true" },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = { "netrwPlugin" },
    },
  },
})
