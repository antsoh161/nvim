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
  { "nvim-lua/plenary.nvim",                       commit = "0dbe561ae023f02c2fb772b879e905055b939ce3" }, -- Useful lua functions used by lots of plugins,
  { "windwp/nvim-autopairs",                       commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }, -- Autopairs, integrates with both cmp and treesitter,
  { "numToStr/Comment.nvim",                       commit = "a89339ffbee677ab0521a483b6dac7e2e67c907e" },
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f" },
  { "kyazdani42/nvim-web-devicons",                commit = "cfc8824cc1db316a276b36517f093baccb8e799a" },
  { "nvim-tree/nvim-tree.lua",                     commit = "00741206c2df9c4b538055def19b99790f0c95c8" },
  { "akinsho/bufferline.nvim",                     commit = "9961d87bb3ec008213c46ba14b3f384a5f520eb5" },
  { "moll/vim-bbye",                               commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { "nvim-lualine/lualine.nvim",                   commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },
  { "akinsho/toggleterm.nvim",                     commit = "12cba0a1967b4f3f31903484dec72a6100dcf515" },
  { "ahmedkhalf/project.nvim",                     commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },
  { "lukas-reineke/indent-blankline.nvim",         commit = "9637670896b68805430e2f72cf5d16be5b97a22a" },
  { "goolord/alpha-nvim",                          commit = "5f211a1597b06be24b1600d72a62b94cab1e2df9" },
  --  {"folke/which-key.nvim"},
  { "tiagovla/scope.nvim",                         commit = "b783c77175a3026d19152fd938a5cc066c2f6676" },
  --  { "notjedi/nvim-rooter.lua", commit = "833e6a37fafb9b2acb6228b9005c680face2a20f" } ,

  -- Colorschemes
  { "folke/tokyonight.nvim",                       commit = "9a01eada39558dc3243278e6805d90e8dff45dc0" },
  { "lunarvim/darkplus.nvim",                      commit = "1826879d9cb14e5d93cd142d19f02b23840408a6" },
  { "ellisonleao/gruvbox.nvim",                    commit = "487598d979868224aff92cf8818195c1a60e5dfe" },

  -- cmp plugins
  { "hrsh7th/nvim-cmp",                            commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" }, -- The completion plugin
  { "hrsh7th/cmp-buffer",                          commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
  { "hrsh7th/cmp-path",                            commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
  { "saadparwaiz1/cmp_luasnip",                    commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp",                        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },
  { "hrsh7th/cmp-nvim-lua",                        commit = "f12408bdb54c39c23e67cab726264c10db33ada8" },
  { "lvimuser/lsp-inlayhints.nvim",                commit = "d981f65c9ae0b6062176f0accb9c151daeda6f16" },

  -- snippets
  { "L3MON4D3/LuaSnip",                            commit = "ea7d7ea510c641c4f15042becd27f35b3e5b3c2b" }, --snippet engine
  { "rafamadriz/friendly-snippets",                commit = "00e191fea2cfbbdd378243f35b5953296537a116" }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig",                       commit = "a27356f1ef9c11e1f459cc96a3fcac5c265e72d6" }, -- enable LSP
  { "williamboman/mason.nvim",                     commit = "0942198fb9a998b6ccee36fb8dd7495eb8ba659c" },
  { "williamboman/mason-lspconfig.nvim",           commit = "dfdd771b792fbb4bad8e057d72558255695aa1a7" },
  { "jose-elias-alvarez/null-ls.nvim",             commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }, -- for formatters and linters
  { "RRethy/vim-illuminate",                       commit = "76f28e858f1caae87bfa45fb4fd09e4b053fc45b" },

  -- Telescope
  { "nvim-telescope/telescope.nvim",               commit = "2c1ed33a6f6f2db3b69f5421f6b405eda1b07748" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter", commit = "691d73287a94e8ed82a383df82aabfe77ab4bcaa",
  },

  -- Git
  { "lewis6991/gitsigns.nvim",  commit = "44adf808ace6cb65a3353bd61fa585a2d8fe0db3" },

  -- DAP
  { "mfussenegger/nvim-dap",    commit = "31e1ece773e10448dcb616d5144290946a6264b7" },
  { "rcarriga/nvim-dap-ui",     commit = "85b16ac2309d85c88577cd8ee1733ce52be8227e" },
}

local opts = {}

lazy.setup(plugins, opts)
