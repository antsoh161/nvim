return {
   {
      "saghen/blink.cmp",
      -- dependencies = {
      --    "giuxtaposition/blink-cmp-copilot",
      -- },
      lazy = false,
      event = "InsertEnter",
      version = "v0.*",
      opts = {
         keymap = {
            preset = "default",
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
         },
         completion = {
            list = {
               max_items = 50,
               selection = "manual",
            },
            trigger = {
               show_in_snippet = false,
               show_on_keyword = false,
               show_on_trigger_character = false,
            },
            accept = {
               auto_brackets = {
                  enabled = true,
               },
            },
            menu = {
               enabled = true,
               border = "rounded",
               draw = {
                  columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                  treesitter = { "lsp" },
               },
            },
            documentation = {
               auto_show = true,
               auto_show_delay_ms = 200,
            },
            ghost_text = {
               enabled = false,
            },
         },
         sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            -- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
            -- providers = {
            --    lsp = {
            --       name = "LSP",
            --       module = "blink.cmp.sources.lsp",
            --       score_offset = 5,
            --    },
               -- copilot = {
               --    name = "copilot",
               --    module = "blink-cmp-copilot",
               --    kind = "Copilot",
               -- },
            -- },
            cmdline = {},
         },

         appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
            kind_icons = {
               Array = " ",
               Boolean = "󰨙 ",
               Class = " ",
               Codeium = "󰘦 ",
               Color = " ",
               Control = " ",
               Collapsed = " ",
               Constant = "󰏿 ",
               Constructor = " ",
               Copilot = " ",
               Enum = " ",
               EnumMember = " ",
               Event = " ",
               Field = " ",
               File = " ",
               Folder = " ",
               Function = "󰊕 ",
               Interface = " ",
               Key = " ",
               Keyword = " ",
               Method = "󰊕 ",
               Module = " ",
               Namespace = "󰦮 ",
               Null = " ",
               Number = "󰎠 ",
               Object = " ",
               Operator = " ",
               Package = " ",
               Property = " ",
               Reference = " ",
               Snippet = " ",
               String = " ",
               Struct = "󰆼 ",
               Supermaven = " ",
               TabNine = "󰏚 ",
               Text = " ",
               TypeParameter = " ",
               Unit = " ",
               Value = " ",
               Variable = "󰀫 ",
            },
         },
      },
   },
   {
      "echasnovski/mini.pairs",
      event = "VeryLazy",
      opts = {
         modes = { insert = true, command = true, terminal = false },
         -- skip autopair when next character is one of these
         skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
         -- skip autopair when the cursor is inside these treesitter nodes
         skip_ts = { "string" },
         -- skip autopair when next character is closing pair
         -- and there are more closing pairs than opening pairs
         skip_unbalanced = true,
         -- better deal with markdown code blocks
         markdown = true,
      },
      config = function(_, opts)
         local pairs = require("mini.pairs")
         pairs.setup(opts)
         local open = pairs.open
         pairs.open = function(pair, neigh_pattern)
            if vim.fn.getcmdline() ~= "" then
               return open(pair, neigh_pattern)
            end
            local o, c = pair:sub(1, 1), pair:sub(2, 2)
            local line = vim.api.nvim_get_current_line()
            local cursor = vim.api.nvim_win_get_cursor(0)
            local next = line:sub(cursor[2] + 1, cursor[2] + 1)
            local before = line:sub(1, cursor[2])
            if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
               return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
            end
            if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
               return o
            end
            if opts.skip_ts and #opts.skip_ts > 0 then
               local ok, captures =
                   pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
               for _, capture in ipairs(ok and captures or {}) do
                  if vim.tbl_contains(opts.skip_ts, capture.capture) then
                     return o
                  end
               end
            end
            if opts.skip_unbalanced and next == c and c ~= o then
               local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
               local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
               if count_close > count_open then
                  return o
               end
            end
            return open(pair, neigh_pattern)
         end
      end,
   },
}
