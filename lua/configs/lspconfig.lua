require("nvchad.configs.lspconfig").defaults()

local servers = { "luals", "pyright", "texlab" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
