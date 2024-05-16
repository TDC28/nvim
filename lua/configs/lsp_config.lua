local lspconfig = require("lspconfig")
local servers = { "lua_ls", "pyright", "jsonls", "texlab", "bashls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end
