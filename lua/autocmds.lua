vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "python", "lua", "sh", "json" },
    callback = function()
        require("conform").format({ async = false, timeout_ms = 3000 })
        vim.cmd("retab")
    end,
})

vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })

        if #buffers > 1 then
            vim.opt.showtabline = 2
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "sh", "javascript", "typescript" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})
