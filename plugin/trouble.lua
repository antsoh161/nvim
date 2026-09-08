vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({
  focus = true,
  auto_refresh = true,
  auto_preview = true,
  modes = {
    symbols = {
      win = { position = "bottom", size = { width = 0.3, height = 0.3 } },
    },
    diagnostics = {
      win = { position = "bottom", size = { width = 0.3, height = 0.3 } },
    },
  },
})

local map = vim.keymap.set
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
  "n",
  "<leader>tl",
  "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
