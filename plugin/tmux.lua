vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })

-- The plugin's own <C-h/j/k/l> mappings are set up automatically once
-- loaded; these arrow-key variants are the only custom additions.
vim.keymap.set("n", "<c-Left>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-Down>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-Up>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-Right>", "<cmd>TmuxNavigateRight<cr>")
