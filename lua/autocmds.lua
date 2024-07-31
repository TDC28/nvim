-- Function to move cursor to the first character of the line
local function move_cursor_to_end()
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('normal! $')
  end
end

-- Autocommand to move cursor to the first character on cursor move
vim.api.nvim_create_autocmd({'CursorMoved', 'BufEnter'}, {
  pattern = 'NvimTree_*',
  callback = move_cursor_to_end,
})
