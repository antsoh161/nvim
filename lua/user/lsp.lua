return {
	"neovim/nvim-lspconfig",
   dependencies = { "saghen/blink.cmp" },
	event = "BufReadPre",
	cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
	opts = { inlay_hints = true },

	config = function()
		local on_attach = function(client, bufnr)
			require("keymaps").lsp_keymaps(client, bufnr)
		end
		require("config.lsp").setup()
		require("config.lsp").on_dynamic_capability(on_attach)

		local signs = {
			{ name = "DiagnosticSignError", text = " " },
			{ name = "DiagnosticSignWarn", text = " " },
			{ name = "DiagnosticSignHint", text = " " },
			{ name = "DiagnosticSignInfo", text = " " },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local my_capabilities = {
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
				offsetEncoding = { "utf-16" },
			},
		}

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			-- cmp_nvim_lsp.default_capabilities(),
         require("blink.cmp").get_lsp_capabilities(),
			my_capabilities
		)

		local config = {
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			signs = false,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
		}
		vim.diagnostic.config(config)

		local lspconfig = require("lspconfig")
		local on_init = function(client, _)
			-- if client:supports_method("textDocument/semanticTokens") then
			-- 	client.server_capabilities.semanticTokensProvider = nil
			-- end
		end

		for _, server in pairs(require("config.lsp").lsp_servers) do
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
	end,
}
