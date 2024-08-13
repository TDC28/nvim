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
		"htmldjango",
		"css",
		"cpp",
		"gitignore",
		"json",
		"sql",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
