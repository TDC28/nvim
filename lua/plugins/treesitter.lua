return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_instll = true,
			ensure_installed = { "lua", "python", "css", "html", "javascript" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
