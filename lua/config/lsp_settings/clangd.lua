local clangd_cmd = vim.fn.glob("~/.local/share/nvim/mason/packages/clangd/*/bin/clangd")
return {
  cmd = {
    clangd_cmd,
    "--log=error",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--malloc-trim",
    "--fallback-style=llvm",
    "--query-driver=/opt/gcc-snapshot/usr/bin/g++"
  },
}
