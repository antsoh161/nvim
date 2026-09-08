vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/sindrets/diffview.nvim",
})

require("gitsigns").setup({
  signs = {
    add = { text = "▎▎" },
    change = {
      text = "▎▎",
    },
    delete = {
      text = "󰐊",
    },
    topdelete = {
      text = "󰐊",
    },
    changedelete = {
      text = "▎▎",
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = false,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    -- Actions
    map("n", "<leader>Gt", gs.toggle_current_line_blame)
  end,
})
