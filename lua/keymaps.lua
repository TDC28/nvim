local keymap = vim.keymap.set

-- Normal mode
keymap("n", ";", ":")
keymap("n", "<LEADER>e", "<CMD>NvimTreeToggle<CR>")
keymap("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>")
keymap("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>")
keymap("n", "<LEADER>ff", "<CMD>Telescope find_files<CR>")
keymap("n", "<LEADER>fg", "<CMD>Telescope live_grep<CR>")

-- Insert mode
keymap("i", "jk", "<ESC>")
