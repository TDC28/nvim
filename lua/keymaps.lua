local keymap = vim.keymap.set

-- Normal mode
keymap("n", "<LEADER>ff", "<CMD>Telescope find_files<CR>")
keymap("n", "<LEADER>fw", "<CMD>Telescope live_grep<CR>")
keymap("n", ";", ":")

keymap("n", "<LEADER>th", require("nvchad.themes").open)
keymap("n", "<LEADER>ra", require("nvchad.lsp.renamer"))

-- Term
keymap("n", "<LEADER>tt", function()
	require("nvchad.term").toggle({ pos = "float", id = "mainterm" })
end)

-- Tabufline
keymap("n", "<TAB>", require("nvchad.tabufline").next)
keymap("n", "<S-TAB>", require("nvchad.tabufline").prev)
keymap("n", "<LEADER>x", require("nvchad.tabufline").close_buffer)
keymap("n", "<LEADER>;", function()
	require("nvchad.tabufline").move_buf(1)
end)
keymap("n", "<LEADER>h", function()
	require("nvchad.tabufline").move_buf(-1)
end)

-- Terminal mode
keymap("t", "<LEADER>tt", function()
	require("nvchad.term").toggle({ pos = "float", id = "mainterm" })
end)
