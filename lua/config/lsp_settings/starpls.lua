local starpls_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/starpls")
return {
   cmd = { starpls_cmd },
}
