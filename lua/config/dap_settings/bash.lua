local mason = vim.fn.stdpath("data") .. "/mason/packages"

return {
  {
    name = "Bash: Launch current file",
    type = "bash-debug",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    pathBashdb = mason .. "/bash-debug-adapter/extension/bashdb_dir/bashdb",
    pathBashdbLib = mason .. "/bash-debug-adapter/extension/bashdb_dir",
    pathBash = "bash",
    pathCat = "cat",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    env = {},
    args = {},
  },
}
