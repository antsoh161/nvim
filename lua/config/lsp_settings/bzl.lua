local bzl_cmd = vim.fn.glob("~/.local/share/nvim/mason/bzl")
return {
  default_config = {
    cmd = { bzl_cmd, "lsp", "serve" },
    filetypes = { "bzl", "BUILD" },
  },
  root_dir = require("lspconfig").util.root_pattern("WORKSPACE", "WORKSPACE.bazel"),
}
