-- Shorten function name
local M = {}
M.global_keymaps = function()
	local keymap = vim.keymap.set
	-- Silent keymap option
	local opts = { silent = true }
	--Remap space as leader key
	keymap("", "<Space>", "<Nop>", opts)
	vim.g.mapleader = " "

   -- Took me 3 hours to find this mega-griefing 
	vim.keymap.del("n", "grr", opts)
	vim.keymap.del("n", "gra", opts)
	vim.keymap.del("n", "grn", opts)
	vim.keymap.del("n", "gri", opts)

	-- Modes
	--   normal_mode = "n", insert_mode = "i",
	--   visual_mode = "v",
	--   visual_block_mode = "x",
	--   term_mode = "t",
	--   command_mode = "c",

	-- Normal --
	-- Better window navigation
	-- keymap("n", "<C-h>", "<C-w>h", opts)
	-- keymap("n", "<C-j>", "<C-w>j", opts)
	-- keymap("n", "<C-k>", "<C-w>k", opts)
	-- keymap("n", "<C-l>", "<C-w>l", opts)
	-- Toggle hybrid relative line numbers
	-- :set nu for absolute
	keymap("n", "<leader>nn", ":set nu rnu!<CR>", opts)

	-- Move to first word instead of beginning of line
	keymap("n", "0", "^", opts)

	-- splits
	keymap("n", "<leader>w", ":vsplit<CR>", opts)
	--keymap("n", "<leader>h", ":split<CR>", opts) who uses h-split anyway

	-- Save file
	keymap("n", "<leader>ss", ":w<CR>", opts)
	keymap("n", "<leader>sa", ":wa<CR>", opts)

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
	keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

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
	-- keymap("n", "<leader>ee", ":silent! NvimTreeToggle<CR>", opts)
	-- keymap("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

	-- Oil
	keymap("n", "<leader>ee", ":Oil<CR>", opts)

	-- toggleterm
	-- press 'a' to jump back to insert mode in terminal
	-- keymap("n", "<leader>tf", ":ToggleTerm<CR>", opts)
	-- keymap("n", "<leader>tb", ":Toggle")

	-- scope / tabs
	-- tabnext is toggle right, tabNext is toggle left (nice naming choice)
	-- keymap("n", "<leader>tt", ":tabnew<CR>", opts)
	-- keymap("n", "<leader>tc", ":tabclose<CR>", opts)
	-- keymap("n", "<leader>tn", ":tabnext<CR>", opts)
	-- keymap("n", "<C-L>", ":tabNext<CR>", opts)

	-- Telescope
	keymap("n", "<leader>ff", ":silent! Telescope find_files<CR>", opts)
	keymap("n", "<leader>ft", ":silent! Telescope live_grep_args<CR>", opts)
	-- keymap("n", "<leader>fp", ":silent! Telescope projects<CR>", opts)
	keymap("n", "<leader>fb", ":silent! Telescope buffers<CR>", opts)
	keymap("n", "<leader>fr", ":silent! Telescope oldfiles<CR>", opts)

	-- Telescope/Git
	keymap("n", "<leader>fx", ":Telescope git_status<CR>", opts)
	-- keymap("n", "<leader>fc", ":Telescope git_commits<CR>", opts)
	keymap("n", "<leader>fv", ":Telescope git_branches<CR>", opts)
	keymap("n", "<leader>fs", ":Telescope git_stash<CR>", opts)
	keymap("n", "<leader>GG", ":Git<CR>", opts)

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
	keymap("n", "<leader>fd", ":Telescope dap configurations<cr>", opts)

	-- Lsp
	keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	keymap({ "v", "x" }, "<leader>lf", vim.lsp.buf.format, opts)
	keymap("n", "gh", ":ClangdSwitchSourceHeader<CR>", opts)

	-- Overseer
	keymap("n", "<leader>or", ":OverseerRun<CR>", opts)
	keymap("n", "<leader>oo", ":OverseerToggle<CR>", opts)

	-- Noice
	keymap("n", "<leader>mm", ":Noice<CR>", opts)
	keymap("n", "<leader>ml", ":NoiceLast<CR>", opts)
	keymap("n", "<leader>mh", ":NoiceHistory<CR>", opts)

	keymap("n", "<C-q>", ":SmartQuit<CR>", opts)
	keymap("n", "<C-Q>", ":SmartQuit<CR>", opts)

	-- Ai
	keymap({ "n", "v", "x" }, "<leader>aa", ":CopilotChatToggle<CR>", opts)
	keymap({ "n", "v", "x" }, "<leader>ax", ":CopilotChatReset<CR>", opts)
	keymap({ "n", "v", "x" }, "<leader>ac", ":CopilotChatCommitStaged<CR>", opts)
	keymap({ "v", "x" }, "<leader>af", ":CopilotChatFix<CR>", opts)
	keymap({ "v", "x" }, "<leader>ae", ":CopilotChatExplain<CR>", opts)
end

M.lsp_keymaps = function(client, bufnr)
	local function toggle_hints()
		if vim.g.inlay_hints_visible then
			vim.g.inlay_hints_visible = false
			vim.lsp.inlay_hint.enable(false, { bufnr })
		else
			if client.server_capabilities.inlayHintProvider and vim.bo[bufnr].buftype == "" then
				vim.g.inlay_hints_visible = true
				vim.lsp.inlay_hint.enable(true, { bufnr })
			end
		end
	end

	local function toggle_codelens()
		if client.server_capabilities.codeLensProvider then
			if vim.g.codelens_visible then
				vim.g.codelens_visible = false
				vim.lsp.codelens.clear(client, bufnr)
			end
		else
			vim.g.codelens_visible = true
			vim.lsp.codelens.refresh()
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("CodeLensToggle", { clear = true }),
				buffer = bufnr,
				callback = function()
					if vim.g.codelens_enabled then
						vim.lsp.codelens.refresh()
					end
				end,
			})
		end
	end

	local function opts(_bufnr, desc)
		return { buffer = _bufnr, desc = "LSP " .. desc }
	end

	local function on_list(options)
		vim.fn.setqflist({}, " ", options)
		vim.cmd.cfirst()
	end

	local keymap = vim.keymap.set
	keymap("n", "gD", vim.lsp.buf.declaration, opts(bufnr, "Go to declaration"))
	keymap("n", "gd", vim.lsp.buf.definition, opts(bufnr, "Go to definition"))
	keymap("n", "<C-Space>", vim.lsp.buf.hover, opts(bufnr, "Hover"))
	keymap("n", "gI", vim.lsp.buf.implementation, opts(bufnr, "Go to implementation"))
keymap("n", "gr", function() vim.lsp.buf.references() end, opts(bufnr, "Go to references"))
	keymap("n", "gl", vim.diagnostic.open_float, opts(bufnr, "Open diagnostic"))
	keymap("n", "<leader>la", vim.lsp.buf.code_action, opts(bufnr, "Do code action"))
	keymap("n", "<leader>lr", vim.lsp.buf.rename, opts(bufnr, "Rename"))
	keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts(bufnr, "Signature"))
	keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts(bufnr, "Set loclist"))

	keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>", opts(bufnr, "Jump to next"))
	keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.jump({ count = -1 })<CR>", opts(bufnr, "Jump to prev"))
	keymap("n", "<leader>lt", toggle_hints, opts(bufnr, "Toggle inlay hints"))
	keymap("n", "<leader>lc", toggle_codelens, opts(bufnr, "Toggle inlay hints"))
end

return M
