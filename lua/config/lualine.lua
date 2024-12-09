local colors = {
	base = "#eff1f5",
	text = "#4c4f69",
	surface0 = "#ccd0da",
	surface1 = "#bcc0cc",
}

local theme = {
	normal = {
		a = { bg = "#1e66f5", fg = colors.base },
		b = { bg = "#1e66f5", fg = colors.base },
		c = { bg = colors.base, fg = "#4c4f69" },
	},
	insert = { a = { bg = "#40a02b", fg = colors.base } },
	visual = { a = { bg = "#8839ef", fg = colors.base } },
	replace = { a = { bg = "#ffffff", fg = colors.base } },
	command = { a = { bg = "#fe640b", fg = colors.base } },
	terminal = { a = { bg = "#40a02b", fg = colors.base } },
}

local mode = {
	"mode",
	separator = { right = "" },
}

local vim_icon = {
	function()
		return ""
	end,
	separator = { left = " " },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.base, fg = colors.base },
}

local filename = {
	"filename",
	color = { bg = colors.surface0, fg = colors.text },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.surface0 },
	separator = { right = "" },
}

local branch = {
	"branch",
	color = { bg = colors.surface0, fg = colors.text },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = colors.text },
	separator = { left = "", right = "" },
}

local encoding = {
	"encoding",
	color = { bg = colors.surface0, fg = colors.text },
	separator = { left = "", right = "" },
}

local fileformat = {
	"fileformat",
	color = { bg = colors.surface1, fg = "#313244" },
	separator = { left = "", right = " " },
}

local dia = {
	"diagnostics",
	color = { bg = colors.text, fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = "No Active Lsp"
	local clients = vim.lsp.get_clients({ bufnr = 0 }) -- Get clients attached to the current buffer

	if not next(clients) then
		return "  " .. msg
	end

	for _, client in ipairs(clients) do
		-- If the client is attached to the buffer, return its name
		if client.attached_buffers and client.attached_buffers[vim.api.nvim_get_current_buf()] then
			return "  " .. client.name
		end
	end

	return "  " .. msg
end

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.surface0, fg = colors.text },
}

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
		globalstatus = true,
		theme = theme,
	},
	sections = {
		lualine_a = { vim_icon, mode },
		lualine_b = { space },
		lualine_c = { filename, filetype, space, branch, diff },
		lualine_x = { space },
		lualine_y = { dia, lsp },
		lualine_z = { space, encoding, fileformat },
	},
})
