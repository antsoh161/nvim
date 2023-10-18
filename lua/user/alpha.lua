local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
}
function M.config()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[  ____               _  _  _         __     __ ___  __  __ ]],
    [[ / ___|  ___   _ __ (_)| || |  __ _  \ \   / /|_ _||  \/  |]],
    [[| |  _  / _ \ | '__|| || || | / _` |  \ \ / /  | | | |\/| |]],
    [[| |_| || (_) || |   | || || || (_| |   \ V /   | | | |  | |]],
    [[ \____| \___/ |_|   |_||_||_| \__,_|    \_/   |___||_|  |_|]],
    [[                                              ]],
    [[                  ████████████████            ]],
    [[                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒████          ]],
    [[              ▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▓▓        ]],
    [[            ██▒▒██████████▓▓▓▓▒▒▒▒▓▓▓▓██      ]],
    [[            ████  ░░  ░░░░████▓▓▒▒▒▒▓▓▓▓██    ]],
    [[            ██░░░░░░░░░░░░▒▒██▓▓▒▒▒▒▒▒▓▓▓▓██  ]],
    [[            ██████░░░░██████████▓▓▒▒████▓▓▓▓██]],
    [[          ██░░██░░    ░░██░░▒▒██▓▓██░░██▒▒▓▓██]],
    [[          ██  ░░░░░░░░  ░░░░▒▒████▓▓████▒▒▓▓▓▓]],
    [[        ██      ██░░██  ░░  ░░░░████▓▓▒▒▒▒▒▒▓▓]],
    [[      ██                  ░░░░░░░░██▒▒▓▓▒▒▒▒██]],
    [[      ████████░░    ░░░░░░░░░░░░░░████▓▓▒▒▒▒██]],
    [[      ██░░░░░░░░░░░░░░░░░░░░░░░░▒▒████▒▒▒▒██▓▓]],
    [[        ██░░░░░░▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒████▓▓▒▒▒▒▒▒▒▒]],
    [[        ██████████████████████████▓▓▒▒▒▒▒▒▒▒▒▒]],
    [[      ██▒▒██▓▓▓▓██████████████▓▓▓▓▒▒▓▓▒▒▒▒▒▒▓▓]],
    [[    ██▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒██▓▓]],

  }
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }

  local function footer()
    return "🦍"
  end
  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
