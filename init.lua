vim.g.mapleader = " "
vim.loader.enable()

require("options")
require("keymaps").global_keymaps()

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind == "delete" then
      return
    end
    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    elseif name == "mason.nvim" then
      vim.schedule(function()
        if not pcall(vim.cmd, "MasonUpdate") then
          vim.notify("mason.nvim installed - run :MasonUpdate manually to finish", vim.log.levels.WARN)
        end
      end)
    elseif name == "markdown-preview.nvim" then
      -- Same reasoning as mason.nvim above.
      vim.schedule(function()
        if not pcall(vim.fn["mkdp#util#install"]) then
          vim.notify(
            "markdown-preview.nvim installed - run :call mkdp#util#install() manually to finish",
            vim.log.levels.WARN
          )
        end
      end)
    end
  end,
})

require("autocommands")
