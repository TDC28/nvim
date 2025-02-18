vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = { "*.py", "*.lua", "*.sh" },
   callback = function()
      require("conform").format({ async = false, timeout_ms = 3000 })
      vim.cmd("retab")
   end,
})
