vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

-- mason.nvim must be set up before mason-lspconfig touches the registry.
require("mason").setup()
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

local mason_tools = { "stylua", "shfmt" }
local mr = require("mason-registry")
mr.refresh(function()
  for _, tool in ipairs(mason_tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end)

local lsp_servers = require("config.lsp").lsp_servers

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

require("config.lsp").on_attach(function(client, buffer)
  require("keymaps").lsp_keymaps(client, buffer)
end)
require("config.lsp").setup()
require("config.lsp").on_dynamic_capability(require("keymaps").lsp_keymaps)

-- folds (LSP-provided, enabled)
require("config.lsp").on_supports_method("textDocument/foldingRange", function(_, buffer)
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.vim.lsp.foldexpr()"
  vim.opt_local.foldlevel = 99 -- Don't auto-fold anything by default
end)

local capabilities = {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
}
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end
vim.lsp.config("*", { capabilities = capabilities })

local mason_all = vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
for _, server in ipairs(lsp_servers) do
  local ok_settings, settings = pcall(require, "config.lsp_settings." .. server)
  vim.lsp.config(server, ok_settings and settings or {})
  if not vim.tbl_contains(mason_all, server) then
    vim.lsp.enable(server)
  end
end

require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  automatic_enable = true,
})
