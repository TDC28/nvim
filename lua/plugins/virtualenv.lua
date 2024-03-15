return {
	"AckslD/swenv.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
	},

	config = function()
		require("swenv").setup({
			post_set_venv = function()
				vim.cmd("LspRestart")
			end,
		})
	end,
}
