local status_ok, nvim_rooter = pcall(require, "nvim-rooter")
if not status_ok then
	return
end

nvim_rooter.setup {
  rooter_patterns = { '.git', 'package.json' },
  trigger_patterns = { '*' },
  -- manual = true,
}
