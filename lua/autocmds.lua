vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = { "*.py", "*.lua", "*.sh" },
   callback = function()
      require("conform").format({ async = false, timeout_ms = 3000 })
      vim.cmd("retab")
   end,
})

vim.api.nvim_create_autocmd({ "BufAdd" }, {
   callback = function()
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      if #buffers > 1 then
         vim.opt.showtabline = 2
      end
   end,
})
