local keymap = vim.keymap.set
local telescope = require("telescope.builtin")

-- Telescope
keymap("n", "<leader>fw", telescope.live_grep, {})
keymap("n", "<leader>ff", telescope.find_files, {})

keymap("n", ";", ":", {})
