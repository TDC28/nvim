return {
--    {
--       "nvim-lualine/lualine.nvim",
--       config = function()
--          require("config.lualine")
--       end
--    },

   {
      "williamboman/mason-lspconfig.nvim",
      event = "BufRead",
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
         require("config.lsp")
      end
   },

   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = "BufRead",
      config = function()
         require("config.treesitter")
      end,
   },

   {
      "nvim-tree/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = {
         view = {
            float = {
               enable = true
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

   {
      "folke/lazydev.nvim",
      ft = "lua",
      config = true
   },

   {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
      dependencies = {
         "neovim/nvim-lspconfig",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "L3MON4D3/LuaSnip",
         "saadparwaiz1/cmp_luasnip"
      },
      config = function()
         local cmp = require'cmp'

         cmp.setup({
            snippet = {
               -- REQUIRED - you must specify a snippet engine
               expand = function(args)
                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
               end,
            },
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
               ['<TAB>'] = cmp.mapping.select_next_item(),
               ['<S-TAB>'] = cmp.mapping.select_prev_item(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-e>'] = cmp.mapping.abort(),
               ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
               { name = 'nvim_lsp' },
               { name = 'luasnip' }, -- For luasnip users.
               -- { name = 'ultisnips' }, -- For ultisnips users.
               -- { name = 'snippy' }, -- For snippy users.
            }, {
                  { name = 'buffer' },
               })
         })
      end

   }
}
