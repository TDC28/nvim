local keymap = vim.keymap.set

-- Normal mode
keymap("n", ";", ":", {})
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Cycle tabs" })
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Cycle tabs reversed" })
keymap("n", "t", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree" })
keymap("n", "K", vim.lsp.buf.hover, {})
keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Get definition" })
keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
keymap("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })
