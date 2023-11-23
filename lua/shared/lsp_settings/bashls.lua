return {
	cmd = {
		"bash-language-server",
		"start",
	},
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
	},
	filetype = {
		"sh",
		"zsh",
		"bash",
	},
	single_file_support = true,
}
