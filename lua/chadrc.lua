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

M.nvdash = {
	load_on_startup = true,

	header = {
		"                            ",
		"     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
		"   ▄▀███▄     ▄██ █████▀    ",
		"   ██▄▀███▄   ███           ",
		"   ███  ▀███▄ ███           ",
		"   ███    ▀██ ███           ",
		"   ███      ▀ ███           ",
		"   ▀██ █████▄▀█▀▄██████▄    ",
		"     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
		"                            ",
		"                            ",
	},

	-- buttons = {
	-- 	{ txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
	-- 	{ txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
	-- 	-- more... check nvconfig.lua file for full list of buttons
	-- },
}

return M
