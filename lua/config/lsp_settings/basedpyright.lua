local pyright_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/basedpyright-langserver")
return {
   cmd = { pyright_cmd, "--stdio" },
   filetypes = { "python" },
   root_markers = {
      "pyrightconfig.json",
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
   },
}
