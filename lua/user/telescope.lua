return {
	"nvim-telescope/telescope.nvim",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
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
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
