-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n", insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Toggle hybrid relative line numbers
-- :set nu for absolute
keymap("n", "<leader>nn", ":set nu rnu!<CR>", opts)

-- Move to first word instead of beginning of line
keymap("n", "0", "^", opts)

-- splits
keymap("n", "<leader>w", ":vsplit<CR>", opts)
--keymap("n", "<leader>h", ":split<CR>", opts) who uses h-split anyway

-- Save file
keymap("n", "<leader>s", ":w<CR>", opts)

-- Up/Down faster
keymap("n", "J", "5j<CR>", opts)
keymap("n", "K", "5k<CR>", opts)

-- join lines
keymap("n", "<leader>J", "J<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", opts)

-- Close Window
-- keymap("n", "<C-q>", ":close<CR>", opts)
--
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines up and down
keymap("v", "<C-K>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<C-J>", ":m '>+1<CR>gv=gv", opts)

-- Plugins --

-- NvimTree
-- silent! because this clashes with highlighting on startup
keymap("n", "<leader>ee", ":silent! NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- toggleterm
-- press 'a' to jump back to insert mode in terminal
-- keymap("n", "<leader>tf", ":ToggleTerm<CR>", opts)
-- keymap("n", "<leader>tb", ":Toggle")

-- scope / tabs
-- tabnext is toggle right, tabNext is toggle left (nice naming choice)
-- keymap("n", "<leader>tt", ":tabnew<CR>", opts)
-- keymap("n", "<leader>tc", ":tabclose<CR>", opts)
-- keymap("n", "<leader>tl", ":tabnext<CR>", opts)
-- keymap("n", "<leader>th", ":tabNext<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":silent! Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":silent! Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>fp", ":silent! Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":silent! Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":silent! Telescope oldfiles<CR>", opts)

-- Telescope Git
-- TODO: remove this prob
-- keymap("n", "<leader>fx", ":Telescope git_status<CR>", opts)
-- keymap("n", "<leader>fc", ":Telescope git_commits<CR>", opts)
-- keymap("n", "<leader>fv", ":Telescope git_branches<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("x", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "gh", ":ClangdSwitchSourceHeader<CR>", opts)

-- Ask for qutting because i lost like 2 hours of work once
local UNSAVED_CHANGES_PROMPT = "You have unsaved changes. Quit anyway? (y/n)"
local LAST_WINDOW_PROMPT = "This is the last window. Quit neovim? (y/n)"

local function display_prompt(prompt, callback)
	vim.ui.input({ prompt = prompt }, function(input)
		if input == "y" or input == "Y" then
			callback()
		end
	end)
end

local function smart_quit()
	local bufnr = vim.api.nvim_get_current_buf()
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	local nr_wins = #vim.api.nvim_list_wins()
	for _, win_id in ipairs(vim.api.nvim_list_wins()) do
		local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win_id))
		if bufname:match("NvimTree_") then
			nr_wins = nr_wins - 1 -- Don't count the tree as a window
		end
	end

	local display_confirm = false
	local confirm_callback
	if modified then
		display_confirm = true
		confirm_callback = function()
			vim.cmd("q!")
		end
	elseif nr_wins < 2 then
		display_confirm = true
		confirm_callback = function()
			vim.cmd("q!")
		end
	else
		vim.cmd("q!")
	end
	if display_confirm then
		if modified then
			display_prompt(UNSAVED_CHANGES_PROMPT, confirm_callback)
		else
			display_prompt(LAST_WINDOW_PROMPT, confirm_callback)
		end
	end
end
keymap("n", "<C-q>", smart_quit, opts)
