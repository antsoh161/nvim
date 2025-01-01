return {
   "nvim-telescope/telescope.nvim",
   event = "Bufenter",
   cmd = { "Telescope" },
   dependencies = {
      {
         "nvim-lua/plenary.nvim",
      },
      { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" }
   },

   config = function()
      local actions = require("telescope.actions")
      local layout = require("telescope.actions.layout")
      local trouble_open = require("trouble.sources.telescope").open
      local trouble_add = require("trouble.sources.telescope").add
      local lga_actions = require("telescope-live-grep-args.actions")
      require("telescope").setup({
         defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "truncate" },
            file_ignore_patterns = { ".git/", "node_modules" },

            preview = {
               hide_on_startup = false,
            },
            mappings = {
               i = {
                  ["<Down>"] = actions.cycle_history_next,
                  ["<Up>"] = actions.cycle_history_prev,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                  ["<C-p>"] = layout.toggle_preview,
                  ["<C-t>"] = trouble_open,
               },
               n = {
                  ["<C-t>"] = trouble_open,
               },
            },
         },
         extensions = {
            fzf = {
               fuzzy = true,
               override_generic_sorter = true,
               override_file_sorter = true,
               case_mode = "smart_case",
            },
            live_grep_args = {
               auto_quoting = true,
               mappings = { -- extend mappings
                  i = {
                     ["<C-space>"] = actions.to_fuzzy_refine,
                     ["<Down>"] = actions.cycle_history_next,
                     ["<Up>"] = actions.cycle_history_prev,
                     ["<C-j>"] = actions.move_selection_next,
                     ["<C-k>"] = actions.move_selection_previous,
                     ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                     ["<C-p>"] = layout.toggle_preview,
                  },
               },

            },
         },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
   end,
}
