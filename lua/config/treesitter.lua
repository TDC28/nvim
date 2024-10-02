local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"cpp",
		"gitignore",
		"json",
		"sql",
		"latex",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
