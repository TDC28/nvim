local function lock_cursor()
   if vim.bo.filetype == "NvimTree" then
      local current_line = vim.fn.getline(".")
      local first_char_pos = string.find(current_line, "%w")

      if first_char_pos then
         vim.fn.cursor(0, first_char_pos)
      end
   end
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufEnter' }, {
   pattern = 'NvimTree_*',
   callback = lock_cursor,
})
