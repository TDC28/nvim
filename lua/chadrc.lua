local M = {}

M.base46 = {
	theme = "tokyonight",
	transparency = true,
}

M.colorify = {
	enabled = true,
}

M.ui = {
	telescope = { style = "bordered" },

	cmp = {
		format_colors = { tailwind = true },
		icons_left = true,
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",
	},

	tabufline = {
		enabled = true,
	},
}

return M
