return {
   {
      name = "C++ Launch from path (gdb)",
      type = "gdb",
      request = "launch",
      program = function()
         return vim.fn.input("Path to bin: ", vim.fn.getcwd() .. "/", "file")
      end,
      stopAtEntry = true,
      cwd = "${workspaceFolder}",
   },
   {
      name = "C++ Launch from path (gdb)",
      type = "cppdbg",
      request = "launch",
      program = function()
         return vim.fn.input("Path to bin: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopAtEntry = true,
      MIMode = "gdb",
      miDebuggerPath = "/usr/bin/gdb"
   },
}
