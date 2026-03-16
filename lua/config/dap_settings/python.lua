return {
  {
    name = "Python: Launch file",
    type = "python",
    request = "launch",
    program = "${file}",
    pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv .. "/bin/python"
      end
      return "python3"
    end,
  },
  {
    name = "Python: Launch with arguments",
    type = "python",
    request = "launch",
    program = "${file}",
    args = function()
      local input = vim.fn.input("Arguments: ")
      return vim.split(input, " ", { trimempty = true })
    end,
    pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv .. "/bin/python"
      end
      return "python3"
    end,
  },
  {
    name = "Python: Attach to remote (debugpy)",
    type = "python",
    request = "attach",
    connect = function()
      local host = vim.fn.input("Host: ", "127.0.0.1")
      local port = tonumber(vim.fn.input("Port: ", "5678"))
      return { host = host, port = port }
    end,
  },
}
