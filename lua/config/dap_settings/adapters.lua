if vim.fn.has("win32") == 1 then
  Path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python"
else
  Path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
end

return {
  gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
  },
  -- Assume cpptools via mason
  cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    options = {
      detached = false,
    },
  },
  codelldb = {
    type = "server",
    host = "127.0.0.1",
    port = 13000, --  Use the port printed out or specified with `--port`
  },
  python = function(callback, config)
    if config.request == "attach" then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or "127.0.0.1"
      callback({
        type = "server",
        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
        host = host,
        options = {
          source_filetype = "python",
        },
      })
    else
      callback({
        type = "executable",
        command = Path,
        args = { "-m", "debugpy.adapter" },
        options = {
          source_filetype = "python",
        },
      })
    end
  end,
}
