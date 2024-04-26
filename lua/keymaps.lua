local keymap = vim.keymap.set
local telescope = require("telescope.builtin")

-- Telescope
keymap("n", "<leader>fw", telescope.live_grep, {})
keymap("n", "<leader>ff", telescope.find_files, {})

-- Bufferline
keymap("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
keymap("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")

-- LSP
keymap("n", "<leader>rn", vim.lsp.buf.rename, {})

keymap("n", ";", ":", {})
