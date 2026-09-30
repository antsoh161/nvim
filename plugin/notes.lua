vim.pack.add({
  "https://github.com/jakewvincent/mkdnflow.nvim",
})

local notes_dir = vim.fn.expand("~/notes")
local daily_dir = notes_dir .. "/daily"
local projects_dir = notes_dir .. "/projects"

require("mkdnflow").setup({
  filetypes = { markdown = true },
  links = {
    style = "wiki",
    implicit_extension = "md",
  },
  to_do = {
    highlight = true,
  },
})

local function ensure_dir(dir)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end

local function open_daily_note()
  ensure_dir(daily_dir)
  local path = daily_dir .. "/" .. os.date("%Y-%m-%d") .. ".md"
  local is_new = vim.fn.filereadable(path) == 0
  vim.cmd.edit(path)
  if is_new then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, { "# " .. os.date("%Y-%m-%d"), "", "" })
    vim.api.nvim_win_set_cursor(0, { 3, 0 })
  end
end

local function open_project_note()
  vim.ui.input({ prompt = "Project name: " }, function(name)
    if not name or name == "" then
      return
    end
    ensure_dir(projects_dir)
    local path = projects_dir .. "/" .. name:gsub("%s+", "-"):lower() .. ".md"
    local is_new = vim.fn.filereadable(path) == 0
    vim.cmd.edit(path)
    if is_new then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, { "# " .. name, "", "## TODO", "", "## Notes", "" })
    end
  end)
end

local map = vim.keymap.set
map("n", "<leader>nd", open_daily_note, { desc = "Notes: Daily note" })
map("n", "<leader>np", open_project_note, { desc = "Notes: New/open project" })

map("n", "<leader>nf", function()
  require("fzf-lua").files({ cwd = notes_dir, prompt = "Notes❯ " })
end, { desc = "Notes: Find" })
map("n", "<leader>ng", function()
  require("fzf-lua").live_grep({ cwd = notes_dir, prompt = "Notes Grep❯ " })
end, { desc = "Notes: Grep" })
