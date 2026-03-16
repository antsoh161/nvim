local function prompt_executable()
  local co = coroutine.running()
  local default_path = vim.fn.getcwd() .. "/"
  local cargo_toml = vim.fn.findfile("Cargo.toml", vim.fn.getcwd())
  if cargo_toml ~= "" then
    local lines = vim.fn.readfile(cargo_toml)
    for _, line in ipairs(lines) do
      local name = line:match('^name%s*=%s*"(.-)"')
      if name then
        local candidate = vim.fn.getcwd() .. "/target/debug/" .. name
        if vim.fn.filereadable(candidate) == 1 then
          default_path = candidate
        end
        break
      end
    end
  end
  vim.ui.input({ prompt = "Path to executable: ", default = default_path, completion = "file" }, function(path)
    vim.schedule(function()
      coroutine.resume(co, path)
    end)
  end)
  return coroutine.yield()
end

local function prompt_pid()
  local co = coroutine.running()
  local items = {}
  local output = vim.fn.systemlist("ps -eo pid,comm --no-headers")
  for _, line in ipairs(output) do
    local pid, name = line:match("^%s*(%d+)%s+(.+)$")
    if pid then
      table.insert(items, { pid = tonumber(pid), name = name })
    end
  end
  vim.ui.select(items, {
    prompt = "Select process: ",
    format_item = function(item)
      return string.format("[%d] %s", item.pid, item.name)
    end,
  }, function(choice)
    vim.schedule(function()
      coroutine.resume(co, choice and choice.pid or nil)
    end)
  end)
  return coroutine.yield()
end

local function prompt_gdbserver()
  local co = coroutine.running()
  vim.ui.input({ prompt = "gdbserver host:port: ", default = "localhost:1234" }, function(addr)
    vim.schedule(function()
      coroutine.resume(co, addr)
    end)
  end)
  return coroutine.yield()
end

local function prompt_stop_on_entry()
  local co = coroutine.running()
  vim.ui.select({ "No", "Yes" }, { prompt = "Stop on entry?" }, function(choice)
    vim.schedule(function()
      coroutine.resume(co, choice == "Yes")
    end)
  end)
  return coroutine.yield()
end

return {
  {
    name = "Rust Launch (codelldb)",
    type = "codelldb",
    request = "launch",
    program = prompt_executable,
    cwd = "${workspaceFolder}",
    stopOnEntry = prompt_stop_on_entry,
  },
  {
    name = "Rust Launch (GDB)",
    type = "gdb",
    request = "launch",
    program = prompt_executable,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = prompt_stop_on_entry,
  },
  {
    name = "Rust Attach to PID (codelldb)",
    type = "codelldb",
    request = "attach",
    pid = prompt_pid,
  },
  {
    name = "Rust Attach to gdbserver",
    type = "gdb",
    request = "attach",
    target = prompt_gdbserver,
    cwd = "${workspaceFolder}",
  },
}
