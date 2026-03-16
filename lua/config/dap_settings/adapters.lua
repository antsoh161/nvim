local mason = vim.fn.stdpath("data") .. "/mason/packages"

local debugpy_python = mason .. "/debugpy/venv/bin/python"
local cpptools_bin = mason .. "/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
local codelldb_bin = mason .. "/codelldb/extension/adapter/codelldb"
local bashdb_bin = mason .. "/bash-debug-adapter/bash-debug-adapter"
local bashdb_script = mason .. "/bash-debug-adapter/extension/bashdb_dir"

return {
  gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--quiet" },
  },

  codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb_bin,
      args = { "--port", "${port}" },
    },
  },

  cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = cpptools_bin,
    options = {
      detached = false,
    },
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
        options = { source_filetype = "python" },
      })
    else
      callback({
        type = "executable",
        command = debugpy_python,
        args = { "-m", "debugpy.adapter" },
        options = { source_filetype = "python" },
      })
    end
  end,

  ["bash-debug"] = {
    type = "executable",
    command = bashdb_bin,
    env = {
      BASHDB_HOME = bashdb_script,
    },
  },
}
