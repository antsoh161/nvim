vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  bigfile = { enabled = true },
  statuscolumn = { enabled = true },
  notifier = {
    enabled = true,
    style = "compact",
  },
  indent = {
    enabled = true,
    animate = {
      enabled = false,
    },
  },
  dashboard = {
    width = 140,
    row = 10,
    -- Default sections are header/keys/startup - "startup" unconditionally
    -- calls require("lazy.stats"), which no longer exists now that
    -- lazy.nvim is gone. Drop it; keep header + keys.
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
    preset = {
      keys = {},
      header = [[
  ____               _  _  _         __     __ ___  __  __
 / ___|  ___   _ __ (_)| || |  __ _  \ \   / /|_ _||  \/  |
| |  _  / _ \ | '__|| || || | / _` |  \ \ / /  | | | |\/| |
| |_| || (_) || |   | || || || (_| |   \ V /   | | | |  | |
 \____| \___/ |_|   |_||_||_| \__,_|    \_/   |___||_|  |_|

                  ████████████████
                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒████
              ▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▓▓
            ██▒▒██████████▓▓▓▓▒▒▒▒▓▓▓▓██
            ████  ░░  ░░░░████▓▓▒▒▒▒▓▓▓▓██
            ██░░░░░░░░░░░░▒▒██▓▓▒▒▒▒▒▒▓▓▓▓██
            ██████░░░░██████████▓▓▒▒████▓▓▓▓██
          ██░░██░░    ░░██░░▒▒██▓▓██░░██▒▒▓▓██
          ██  ░░░░░░░░  ░░░░▒▒████▓▓████▒▒▓▓▓▓
        ██      ██░░██  ░░  ░░░░████▓▓▒▒▒▒▒▒▓▓
      ██                  ░░░░░░░░██▒▒▓▓▒▒▒▒██
      ████████░░    ░░░░░░░░░░░░░░████▓▓▒▒▒▒██
      ██░░░░░░░░░░░░░░░░░░░░░░░░▒▒████▒▒▒▒██▓▓
        ██░░░░░░▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒████▓▓▒▒▒▒▒▒▒▒
        ██████████████████████████▓▓▒▒▒▒▒▒▒▒▒▒
      ██▒▒██▓▓▓▓██████████████▓▓▓▓▒▒▓▓▒▒▒▒▒▒▓▓
    ██▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒██▓▓]],
    },
  },
})
