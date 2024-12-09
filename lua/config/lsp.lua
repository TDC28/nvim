local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})
lspconfig.clangd.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.arduino_language_server.setup({})
