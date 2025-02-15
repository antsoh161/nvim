return {
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = false,
      },
      inlay_hints = {
        enable = false,
        only_current_line = true,
        show_parameter_hints = true,
      },
    },
  },
}
