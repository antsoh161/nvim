return {
  settings = {
    diagnostics = {
      semanticErrors = false,
      external = {
        naga = {
          parsing = false,
        },
      },
    },
  },

  handlers = {
    ["textDocument/diagnostic"] = function(err, result, ctx, config)
      if result and result.kind ~= "unchanged" and result.items then
        local bufnr = ctx.bufnr
        local ok_lines, lines = pcall(vim.api.nvim_buf_get_lines, bufnr, 0, -1, false)

        result.items = vim.tbl_filter(function(d)
          local line_nr = d.range and d.range.start and d.range.start.line
          local on_directive_line = ok_lines
            and line_nr
            and lines[line_nr + 1]
            and lines[line_nr + 1]:match("^%s*#")

          local msg = d.message or ""
          if d.source == "naga" or on_directive_line then
            return false
          end
          return not (msg:find("not found in scope", 1, true) or msg:find("switch to WESL", 1, true))
        end, result.items)
      end
      vim.lsp.handlers["textDocument/diagnostic"](err, result, ctx, config)
    end,
  },
}
