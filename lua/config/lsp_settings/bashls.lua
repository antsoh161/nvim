local bash_cmd = vim.fn.glob("~/.local/share/nvim/mason/bin/bash-language-server")
return {
  cmd = {
    bash_cmd,
    "start",
  },
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
  },
  filetype = {
    "sh",
    "zsh",
    "bash",
  },
  single_file_support = true,
}
