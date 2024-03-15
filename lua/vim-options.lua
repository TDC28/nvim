vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "
vim.g.python3_host_prog = "/Users/alexandreboutot/.nvim/.venv/bin/python"
vim.keymap.set('n', ';', ':', {})
vim.keymap.set('n', 't', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', 'C', '<cmd>lua require("swenv.api").pick_venv()<cr>', {})
