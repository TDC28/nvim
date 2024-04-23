local lspconfig = require("lspconfig")
local servers = { "lua_ls", "pyright" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end
