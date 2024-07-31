local keymap = vim.keymap.set

keymap("n", ";", ":")
keymap("n", "<LEADER>e", "<CMD>NvimTreeToggle<CR>")
keymap("n", "<TAB>", "<CMD>BufferLineCycleNext<CR>")
keymap("n", "<S-TAB>", "<CMD>BufferLineCyclePrev<CR>")
keymap("i", "jk", "<ESC>")
