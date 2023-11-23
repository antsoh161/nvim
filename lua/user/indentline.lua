local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "29be0919b91fb59eca9e90690d76014233392bef",
  event = "BufReadPre",
  main = "ibl",
}

local highlight = {
    "CursorColumn",
    "Whitespace",
}

function M.config()
  require("ibl").setup( {
    indent = { char = "▏" },
  }
)
end

return M
