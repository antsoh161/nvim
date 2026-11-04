vim.g.copilot_no_maps = true
vim.g.copilot_filetypes = {
  markdown = false,
  text = false,
  help = false,
  gitcommit = false,
  gitrebase = false,
  oil = false,
  ["snacks_picker_input"] = false,
  [""] = false,
}

vim.pack.add({ "https://github.com/github/copilot.vim" })

local map = vim.keymap.set

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_enabled = false
    vim.fn["copilot#Dismiss"]()
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_enabled = nil
    if vim.fn.mode() == "i" then
      vim.fn["copilot#Suggest"]()
    end
  end,
})

local expr = { expr = true, replace_keycodes = false, silent = true }
map("i", "<C-l>", 'copilot#Accept("")', vim.tbl_extend("force", expr, { desc = "Copilot accept" }))
map("i", "<M-l>", "copilot#AcceptWord()", vim.tbl_extend("force", expr, { desc = "Copilot accept word" }))
map("i", "<M-j>", "copilot#AcceptLine()", vim.tbl_extend("force", expr, { desc = "Copilot accept line" }))
map("i", "<M-n>", "<Cmd>call copilot#Next()<CR>", { silent = true, desc = "Copilot next suggestion" })
map("i", "<M-p>", "<Cmd>call copilot#Previous()<CR>", { silent = true, desc = "Copilot previous suggestion" })
map("i", "<M-s>", "<Cmd>call copilot#Suggest()<CR>", { silent = true, desc = "Copilot request suggestion" })
map("i", "<M-e>", "<Cmd>call copilot#Dismiss()<CR>", { silent = true, desc = "Copilot dismiss" })

-- Normal mode
map("n", "<leader>at", function()
  if vim.fn["copilot#Enabled"]() == 1 then
    vim.cmd("Copilot disable")
    vim.notify("Copilot disabled")
  else
    vim.cmd("Copilot enable")
    vim.notify("Copilot enabled")
  end
end, { desc = "Copilot toggle" })
map("n", "<leader>as", "<cmd>Copilot status<cr>", { desc = "Copilot status" })
map("n", "<leader>ap", "<cmd>Copilot panel<cr>", { desc = "Copilot panel (all suggestions)" })
