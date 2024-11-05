local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"python",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"htmldjango",
		"css",
		"cpp",
		"gitignore",
		"json",
		"latex",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
