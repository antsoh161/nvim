local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	main = "ibl",
}

local highlight = {
	"CursorColumn",
	"Whitespace",
}
function M.config()
	require("ibl").setup({
		indent = { char = "▏" },
	})
end

return M
