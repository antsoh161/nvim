local ruff_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/ruff")
return {
   cmd = { ruff_cmd, "serve"},
   filetypes = { "python"},
   root_dir = function(fname)
      return util.root_pattern('pyproject.toml', 'ruff.toml', '.ruff.toml')(fname)
        or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
    end,

}
