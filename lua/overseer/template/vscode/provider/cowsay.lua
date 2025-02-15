-- lua/overseer/template/vscode/provider/cowsay.lua
local M = {}

---@param defn table This is the decoded JSON data for the task
---@return table
M.get_task_opts = function(defn)
  return {
    -- cmd is required. It can be a string or list of strings.
    cmd = vim.list_extend({ "cowsay" }, { defn.words }),
    cwd = nil,
    env = nil,
    problem_matcher = nil,
  }
end

return M
