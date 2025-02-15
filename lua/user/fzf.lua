return {
   "ibhagwan/fzf-lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = function()
      local img_previewer ---@type string[]?
      for _, v in ipairs({
         { cmd = "viu",      args = { "-b" } },
         { cmd = "chafa",    args = { "{file}", "--format=symbols" } },
         { cmd = "ueberzug", args = {} },
      }) do
         if vim.fn.executable(v.cmd) == 1 then
            img_previewer = vim.list_extend({ v.cmd }, v.args)
            break
         end
      end

      return {
         keymap = {
            builtin = {
               ["ctrl-p"] = "toggle-preview",
            },
         },
         fzf_colors = true,
         fzf_opts = {
            ["--no-scrollbar"] = true,
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
               ["ctrl-i"] = { require("fzf-lua.actions").toggle_ignore },
               ["ctrl-h"] = { require("fzf-lua.actions").toggle_hidden },
            },
         },
         grep = {
            hidden = false,
            actions = {
               ["ctrl-i"] = { require("fzf-lua.actions").toggle_ignore },
               ["ctrl-h"] = { require("fzf-lua.actions").toggle_hidden },
            },
         },
         oldfiles = {
            cwd_only = true,
         },
      }
   end,

   config = function(_, opts)
      require("fzf-lua").setup(opts)
   end,
}
