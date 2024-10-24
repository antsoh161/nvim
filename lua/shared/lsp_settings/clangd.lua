
local clangd_cmd = vim.fn.expand("~/.local/share/nvim/mason/packages/clangd/clangd_19.1.0/bin/clangd")
return {
  cmd = {
      clangd_cmd,
    "--log=error",
    "--pretty",
    "--j=4",
    "--header-insertion=never",
    "--malloc-trim",
      -- "query-driver /path/to/your/gcc"
  }
}
