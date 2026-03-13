local systemd_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/systemd-lsp")
return {
   cmd = systemd_cmd,
   filetypes = { "systemd", "*.service" }
}
