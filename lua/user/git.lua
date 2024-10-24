return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

      -- See docs for a lot of options
		opts = {
			signs = {
				add = { text = "▎▎" },
				change = {
					text = "▎▎",
				},
				delete = {
					text = "󰐊",
				},
				topdelete = {
					text = "󰐊",
				},
				changedelete = {
					text = "▎▎",
				},
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 200,
				ignore_whitespace = false,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Actions
				map("n", "<leader>Gt", gs.toggle_current_line_blame)
			end,
		},
	},
	{
		"tpope/vim-fugitive",
		config = function() end,
	},
	{
		"sindrets/diffview.nvim",
		config = function() end,
	},
}
