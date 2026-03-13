local ruff_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/ruff")
return {
   cmd = { ruff_cmd, "server"},
   filetypes = { "python"},
}
