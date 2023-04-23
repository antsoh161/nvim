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

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Plugin table
local plugins = {
  { "nvim-lua/plenary.nvim",                       commit = "9ac3e9541bbabd9d73663d757e4fe48a675bb054" }, -- Useful lua functions used by lots of plugins,
  { "windwp/nvim-autopairs",                       commit = "7566a86f44bb72ba2b1a609f528a27d93241502d" }, -- Autopairs, integrates with both cmp and treesitter,
  { "numToStr/Comment.nvim",                       commit = "a89339ffbee677ab0521a483b6dac7e2e67c907e" },
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3" },
  { "kyazdani42/nvim-web-devicons",                commit = "4ec26d67d419c12a4abaea02f1b6c57b40c08d7e" },
  { "nvim-tree/nvim-tree.lua",                     commit = "0db85a70248f9a90e61af5cdbafe5d9f4320f719" },
  { "akinsho/bufferline.nvim",                     commit = "8b32447f1ba00f71ec2ebb413249d1d84228d9fb" },
  { "moll/vim-bbye",                               commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { "nvim-lualine/lualine.nvim",                   commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e" },
  { "akinsho/toggleterm.nvim",                     commit = "1c5996ee3c30b54751093fe68d40676859e7778f" },
  { "ahmedkhalf/project.nvim",                     commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },
  { "lewis6991/impatient.nvim",                    commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e" },
  { "lukas-reineke/indent-blankline.nvim",         commit = "018bd04d80c9a73d399c1061fa0c3b14a7614399" },
  { "goolord/alpha-nvim",                          commit = "87c204040e3f5d4c1c95067b35905d8f8a2f2545" },
  --  {"folke/which-key.nvim"},
  { "tiagovla/scope.nvim",                         commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875" },
  --  { "notjedi/nvim-rooter.lua", commit = "833e6a37fafb9b2acb6228b9005c680face2a20f" } ,

  -- Colorschemes
  { "folke/tokyonight.nvim",                       commit = "ff81eac0ecf85db235dfc4c9d54f2d07d662a423" },
  { "lunarvim/darkplus.nvim",                      commit = "1826879d9cb14e5d93cd142d19f02b23840408a6" },
  { "ellisonleao/gruvbox.nvim",                    commit = "487598d979868224aff92cf8818195c1a60e5dfe" },

  -- cmp plugins
  { "hrsh7th/nvim-cmp",                            commit = "777450fd0ae289463a14481673e26246b5e38bf2" }, -- The completion plugin
  { "hrsh7th/cmp-buffer",                          commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
  { "hrsh7th/cmp-path",                            commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
  { "saadparwaiz1/cmp_luasnip",                    commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp",                        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },
  { "hrsh7th/cmp-nvim-lua",                        commit = "f12408bdb54c39c23e67cab726264c10db33ada8" },
  { "lvimuser/lsp-inlayhints.nvim",                commit = "84ca3abe8aaecbb5b30ad89e4701d4a9c821b72c" },

  -- snippets
  { "L3MON4D3/LuaSnip",                            commit = "508b41fb7b2a7f06522f96eb7742d21f025a8512" }, --snippet engine
  { "rafamadriz/friendly-snippets",                commit = "484fb38b8f493ceeebf4e6fc499ebe41e10aae25" }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig",                       commit = "eddaef928c1e1dd79a96f5db45f2fd7f2efe7ea0" }, -- enable LSP
  { "williamboman/mason.nvim",                     commit = "7f364a3c9b3f77ead3dc5316cf6918d944fc3621" },
  { "williamboman/mason-lspconfig.nvim",           commit = "7034065099c1665143091c7282b3b1b8f0b23783" },
  { "jose-elias-alvarez/null-ls.nvim",             commit = "f8ffcd7cb8fb3325c711d459152ef132b5b65aed" }, -- for formatters and linters
  { "RRethy/vim-illuminate",                       commit = "a2907275a6899c570d16e95b9db5fd921c167502" },

  -- Telescope
  { "nvim-telescope/telescope.nvim",               commit = "04af51dbfb17c2afa0b8d82b0e842e0638201ca9" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter", commit = "654216eb04f3fdf0f847ff2d410319fba6cee847",
  },

  -- Git
  { "lewis6991/gitsigns.nvim",  commit = "5d840679cfba0a93b28ba573f982613ca25d3909" },

  -- DAP
  { "mfussenegger/nvim-dap",    commit = "6cedcb527e264c8f25e86afa8dae74c6692dee51" },
  { "rcarriga/nvim-dap-ui",     commit = "286f682f366fbc652b38dff893569374e9433dd3" },
  { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" },
}

local opts = {}

lazy.setup(plugins, opts)
