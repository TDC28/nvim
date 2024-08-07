return {
   {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
         "williamboman/mason.nvim",
         "neovim/nvim-lspconfig",
      },

      config = function()
         require("mason").setup()
         require("mason-lspconfig").setup({
            ensure_installed = {
               "lua_ls",
               "tsserver",
            }
         })
      end
   },
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = "BufRead",
      opts = {
         ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "latex", "python", "css", "cpp" },
         sync_install = false,
         highlight = { enable = true },
         indent = { enable = true },
      }
   },

   {
      "nvim-tree/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         view = {
            float = {
               enable = true,
            }
         }
      }
   },

   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
   },

   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equalent to setup({}) function
   },
   {
      'akinsho/bufferline.nvim',
      event = "BufRead",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = true,
   },

   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
   },

   {
      "kdheepak/lazygit.nvim",
      cmd = {
         "LazyGit",
         "LazyGitConfig",
         "LazyGitCurrentFile",
         "LazyGitFilter",
         "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
         { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
   },

   {
      "christoomey/vim-tmux-navigator",
      cmd = {
         "TmuxNavigateLeft",
         "TmuxNavigateDown",
         "TmuxNavigateUp",
         "TmuxNavigateRight",
         "TmuxNavigatePrevious",
      },
      keys = {
         { "<c-h>",  "<CMD><C-U>TmuxNavigateLeft<CR>" },
         { "<c-j>",  "<CMD><C-U>TmuxNavigateDown<CR>" },
         { "<c-k>",  "<CMD><C-U>TmuxNavigateUp<CR>" },
         { "<c-l>",  "<CMD><C-U>TmuxNavigateRight<CR>" },
         { "<c-\\>", "<CMD><C-U>TmuxNavigatePrevious<CR>" },
      },
   },
}
