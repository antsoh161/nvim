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
	install = { colorscheme = { "catppuccin-mocha" } },
	default = { lazy = false },
	ui = { wrap = "true" },
	change_detection = { enabled = false },
	debug = false,
	performance = {
		rtp = {
			disabled_plugins = { "netrwPlugin" },
		},
	},
})
