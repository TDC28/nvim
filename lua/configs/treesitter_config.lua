local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "lua", "vim", "vimdoc", "python", "json" },
	highlight = { enable = true },
	indent = { enable = true },
})
