vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader>hj", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>hk", function()
  harpoon:list():next()
end)
