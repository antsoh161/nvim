local function pick(picker, opts)
  opts = opts or {}

  -- Handle directory picker for grep
  if opts.dir_picker then
    return function()
      require("fzf-lua").files({
        prompt = opts.dir_prompt or "Choose directory❯ ",
        fd_opts = opts.fd_opts or "--type d",
        cwd = opts.dir_cwd,
        actions = {
          ["default"] = function(selected)
            if selected and selected[1] then
              local path = require("fzf-lua").path.entry_to_file(selected[1])

              local final_opts = {}
              for k, v in pairs(opts) do
                if k ~= "dir_picker" and k ~= "dir_prompt" and k ~= "fd_opts" and k ~= "dir_cwd" then
                  final_opts[k] = v
                end
              end

              final_opts.cwd = path.path
              final_opts.cwd_prompt = true

              require("fzf-lua")[picker](final_opts)
            end
          end,
        },
      })
    end
  end

  return function()
    require("fzf-lua")[picker](opts)
  end
end

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  event = "VeryLazy",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local config = fzf.config
    local actions = fzf.actions

    -- Quickfix
    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
    config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
    config.defaults.keymap.fzf["ctrl-x"] = "jump"
    config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
    config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
    config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

    -- Trouble
    config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open

    -- Toggle root dir / cwd
    config.defaults.actions.files["ctrl-r"] = function(_, ctx)
      local o = vim.deepcopy(ctx.__call_opts)
      o.root = o.root == false
      o.cwd = nil
      o.buf = ctx.__CTX.bufnr
      fzf.pick.open(ctx.__INFO.cmd, o)
    end
    config.defaults.actions.files["alt-c"] = config.defaults.actions.files["ctrl-r"]
    config.set_action_helpstr(config.defaults.actions.files["ctrl-r"], "toggle-root-dir")

    local img_previewer ---@type string[]?
    for _, v in ipairs({
      { cmd = "ueberzug", args = {} },
      { cmd = "chafa", args = { "{file}", "--format=symbols" } },
      { cmd = "viu", args = { "-b" } },
    }) do
      if vim.fn.executable(v.cmd) == 1 then
        img_previewer = vim.list_extend({ v.cmd }, v.args)
        break
      end
    end

    return {
      fzf_colors = true,
      fzf_opts = {
        ["--no-scrollbar"] = true,
        ["--cycle"] = "",
      },
      defaults = {
        -- formatter = "path.filename_first",
        formatter = "path.dirname_first",
      },
      previewers = {
        builtin = {
          extensions = {
            ["png"] = img_previewer,
            ["jpg"] = img_previewer,
            ["jpeg"] = img_previewer,
            ["gif"] = img_previewer,
            ["webp"] = img_previewer,
          },
          ueberzug_scaler = "fit_contain",
        },
      },

      ui_select = function(ui_opts, items)
        local title = vim.trim((ui_opts.prompt or "Select"):gsub("%s*:%s*$", ""))
        local is_codeaction = ui_opts.kind == "codeaction"

        if is_codeaction then
          return {
            prompt = " ",
            winopts = {
              title = " " .. title .. " ",
              title_pos = "center",
              layout = "vertical",
              height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
              width = 0.5,
              preview = #vim.lsp.get_clients({ bufnr = 0, name = "vtsls" }) > 0 and {
                layout = "vertical",
                vertical = "down:15,border-top",
                hidden = "hidden",
              } or {
                layout = "vertical",
                vertical = "down:15,border-top",
              },
            },
          }
        end

        return {
          prompt = " ",
          winopts = {
            title = " " .. title .. " ",
            title_pos = "center",
            width = 0.5,
            height = math.floor(math.min(vim.o.lines * 0.8, math.max(#items + 4, 6)) + 0.5)
          },
        }
      end,
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { "┃", "" },
        },
      },
      files = {
        cwd_prompt = false,
        hidden = false,
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        hidden = false,
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      lsp = {
        symbols = {
          symbol_hl = function(s)
            return "TroubleIcon" .. s
          end,
          symbol_fmt = function(s)
            return s:lower() .. "\t"
          end,
          child_prefix = false,
        },
        code_actions = {
          previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
        },
      },
    }
  end,
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,

  keys = {

    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    {
      "<leader>,",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },

    { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    -- find
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>ff", pick("files"), desc = "Find Files (root)" },
    { "<leader>fF", pick("files", { dir_picker = true }), desc = "Find Files (cwd)" },
    { "<leader>ft", pick("live_grep"), desc = "Grep (root)" },
    { "<leader>fT", pick("live_grep", { dir_picker = true }), desc = "Grep (cwd)" },
    {
      "<leader>fg",
      "<cmd>FzfLua git_files<cr>",
      desc = "Find Files (git-files)",
    },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
    { "<leader>fR", pick("oldfiles", { dir_picker = true }), desc = "Find Files (cwd)" },
    -- git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
  },
}
