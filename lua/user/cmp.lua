return {
   {
      "hrsh7th/nvim-cmp",
      version = false,
      event = "InsertEnter",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
      },
      opts = function()
         vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
         local cmp = require("cmp")
         local defaults = require("cmp.config.default")()
         local auto_select = true
         local lazy_cmp = require("lazyvim.util.cmp")

         local function confirm(opts)
            opts = vim.tbl_extend("force", {
               select = true,
               behavior = cmp.ConfirmBehavior.Insert,
            }, opts or {})
            return function(fallback)
               if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
                  lazy_cmp.create_undo()
                  if cmp.confirm(opts) then
                     return
                  end
               end
               return fallback()
            end
         end

         return {
            auto_brackets = {},
            completion = {
               completeopt = "menu, menuone, noinsert" .. (auto_select and "" or ",noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.item or cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.insert({
               ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
               ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
               ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               ["<C-f>"] = cmp.mapping.scroll_docs(4),
               ["<C-Space>"] = cmp.mapping.complete(),
               ["<CR>"] = confirm({ select = auto_select }),
               ["<C-y>"] = confirm({ select = true }),
               ["<S-CR>"] = confirm({ behavior = cmp.ConfirmBehavior.Replace }),
               ["<C-CR>"] = function(fallback)
                  cmp.abort()
                  fallback()
               end,
               ["<tab>"] = function(fallback)
                  return lazy_cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
               end,
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "path" },
            }, {
               { name = "buffer" },
            }),
            formatting = {
               format = function(entry, item)
                  local icons = {
                     Array         = " ",
                     Boolean       = "󰨙 ",
                     Class         = " ",
                     Codeium       = "󰘦 ",
                     Color         = " ",
                     Control       = " ",
                     Collapsed     = " ",
                     Constant      = "󰏿 ",
                     Constructor   = " ",
                     Copilot       = " ",
                     Enum          = " ",
                     EnumMember    = " ",
                     Event         = " ",
                     Field         = " ",
                     File          = " ",
                     Folder        = " ",
                     Function      = "󰊕 ",
                     Interface     = " ",
                     Key           = " ",
                     Keyword       = " ",
                     Method        = "󰊕 ",
                     Module        = " ",
                     Namespace     = "󰦮 ",
                     Null          = " ",
                     Number        = "󰎠 ",
                     Object        = " ",
                     Operator      = " ",
                     Package       = " ",
                     Property      = " ",
                     Reference     = " ",
                     Snippet       = " ",
                     String        = " ",
                     Struct        = "󰆼 ",
                     Supermaven    = " ",
                     TabNine       = "󰏚 ",
                     Text          = " ",
                     TypeParameter = " ",
                     Unit          = " ",
                     Value         = " ",
                     Variable      = "󰀫 ",
                  }
                  if icons[item.kind] then
                     item.kind = icons[item.kind] .. item.kind
                  end

                  local widths = {
                     abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                     menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                  }

                  for key, width in pairs(widths) do
                     if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                        item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                     end
                  end

                  return item
               end,
            },
            experimental = {
               -- only show ghost text when we show ai completions
               ghost_text = vim.g.ai_cmp and {
                  hl_group = "CmpGhostText",
               } or false,
            },
            sorting = defaults.sorting,
         }
      end,
      main = "lazyvim.util.cmp",
   },
   {
      "nvim-cmp",
      optional = true,
      dependencies = {
         {
            "garymjr/nvim-snippets",
            opts = {
               friendly_snippets = true,
            },
            dependencies = { "rafamadriz/friendly-snippets" },
         },
      },
      opts = function(_, opts)
         opts.snippet = {
            expand = function(item)
               return require("lazyvim.util.cmp").expand(item.body)
            end,
         }
         table.insert(opts.sources, { name = "snippets" })
      end,
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
               local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1,
                  math.max(cursor[2] - 1, 0))
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
  -- comments
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },-- Better text-objects
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  -- Add lazydev source to cmp
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sources, { name = "lazydev", group_index = 0 })
    end,
  },
}
