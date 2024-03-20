return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_instal = true,
      ensure_installed = { "lua", "vim", "vimdoc", "python", "css", "html", "javascript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
