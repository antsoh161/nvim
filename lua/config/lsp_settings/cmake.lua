local cmake_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/cmake-language-server")
return {
  cmd = { cmake_cmd },
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  single_file_support = true,
}
