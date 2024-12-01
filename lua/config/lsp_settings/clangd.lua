local clangd_cmd = vim.fn.expand("~/.local/share/nvim/mason/packages/clangd/clangd_19.1.0/bin/clangd")
return {
	cmd = {
		clangd_cmd,
		"--log=error",
		"--clang-tidy",
		"--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
		"--malloc-trim",
      "--fallback-style=llvm",
		-- "query-driver /path/to/your/gcc"
	},
}
