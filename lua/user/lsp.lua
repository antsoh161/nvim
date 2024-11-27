return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
	opts = { inlay_hints = true },

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		capabilities.offsetEncoding = { "utf-16" }

		local function opts(bufnr, desc)
			return { buffer = bufnr, desc = "LSP " .. desc }
		end

		local function lsp_keymaps(bufnr)
			local keymap = vim.keymap.set
			keymap("n", "gD", vim.lsp.buf.declaration, opts(bufnr, "Go to declaration"))
			keymap("n", "gd", vim.lsp.buf.definition, opts(bufnr, "Go to definition"))
			keymap("n", "<C-Space>", vim.lsp.buf.hover, opts(bufnr, "Hover"))
			keymap("n", "gI", vim.lsp.buf.implementation, opts(bufnr, "Go to implementation"))
			keymap("n", "gr", vim.lsp.buf.references, opts(bufnr, "Go to references"))
			keymap("n", "gl", vim.diagnostic.open_float, opts(bufnr, "Open diagnostic"))
			keymap("n", "<leader>la", vim.lsp.buf.code_action, opts(bufnr, "Do code action"))
			keymap("n", "<leader>lr", vim.lsp.buf.rename, opts(bufnr, "Rename"))
			keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts(bufnr, "Signature"))
			keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts(bufnr, "Set loclist"))

			keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>", opts(bufnr, "Jump to next"))
			keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.jump({ count = -1 })<CR>", opts(bufnr, "Jump to prev"))
		end

		local lspconfig = require("lspconfig")
		local on_attach = function(client, bufnr)
			lsp_keymaps(bufnr)
			-- require("illuminate").on_attach(client)
			if client.server_capabilities.inlayHintProvider then
				-- vim.g.inlay_hints_visible = true
				-- vim.lsp.inlay_hint.enable(true, { bufnr })
			end
		end

		local on_init = function(client, _)
			if client.supports_method("textDocument/semanticTokens") then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		for _, server in pairs(require("shared.lsp").lsp_servers) do
			local lsp_opts = {
				on_attach = on_attach,
				capabilities = capabilities,
				on_init = on_init,
			}

			server = vim.split(server, "@")[1]

			local require_ok, conf_opts = pcall(require, "shared.lsp_settings." .. server)
			if require_ok then
				lsp_opts = vim.tbl_deep_extend("error", conf_opts, lsp_opts)
			end
			lspconfig[server].setup(lsp_opts)
		end

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			-- disable virtual text
			virtual_text = { true },
			signs = false,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
				suffix = "",
			},
		}

		vim.diagnostic.config(config)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})
	end,
}
