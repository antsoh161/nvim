local dap_servers =  {
  "cppdbg",
}

require("mason-nvim-dap").setup({
	ensure_installed = dap_servers,
  handlers = {}, -- Move to handlers.lua
})

