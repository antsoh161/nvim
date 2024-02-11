return {
   "goolord/alpha-nvim",
   event = "VimEnter",

   config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
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
      dashboard.section.buttons.val = {}
      local function footer()
         return "🦍"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"
      dashboard.opts.opts.noautocmd = true
      dashboard.section.footer.val = footer()
      alpha.setup(dashboard.opts)
   end,
}
