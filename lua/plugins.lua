return {
   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "neovim/nvim-lspconfig",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline"
      },
      config = function()
         local cmp = require("cmp")
         local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
         }

         cmp.setup({
            snippet = {
               expand = function(args)
                  vim.snippet.expand(args.body)
               end,
            },
            formatting = {
               format = function(entry, vim_item)
                  vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                  -- vim_item.menu = ({
                  --    buffer = "[Buffer]",
                  --    nvim_lsp = "[LSP]",
                  --    luasnip = "[LuaSnip]",
                  --    nvim_lua = "[Lua]",
                  --    latex_symbols = "[LaTeX]",
                  -- })[entry.source.name]
                  return vim_item
               end
            },
            -- window = {
            --    completion = cmp.config.window.bordered(),
            --    documentation =cmp.config.window.bordered(),
            -- },
            mapping = cmp.mapping.preset.insert({
               ["<TAB>"] = cmp.mapping.select_next_item(),
               ["<S-TAB>"] = cmp.mapping.select_prev_item(),
               ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               ["<C-f>"] = cmp.mapping.scroll_docs(4),
               ["<C-Space>"] = cmp.mapping.complete(),
               ["<C-e>"] = cmp.mapping.abort(),
               ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
            }, {
                  { name = "buffer" }
               })
         })

         -- cmp.setup.cmdline({ "/", "?" }, {
         --    mapping = cmp.mapping.preset.cmdline(),
         --    sources = {
         --       { name = "buffer" }
         --    }
         -- })
         --
         -- cmp.setup.cmdline(":", {
         --    mapping = cmp.mapping.preset.cmdline(),
         --    sources = cmp.config.sources({
         --       { name = "path" }
         --    }, {
         --          { name = "cmdline" }
         --       }),
         --    matching = { disallow_symbol_nonprefix_matching = false }
         -- })
      end,
   },

   {
      "williamboman/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      opts = {},
   },

   {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright" },
         })
      end,
   },

   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim"
      },
      config = function()
         local lspconfig = require("lspconfig")

         require("mason-lspconfig").setup_handlers({
            function(server_name)
               lspconfig[server_name].setup({})
            end,
         })
      end
   },

   {
      "ibhagwan/fzf-lua",
      cmd = "FzfLua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
         { "<leader>ff", "<CMD>FzfLua files<CR>", desc = "Find files" },
         { "<leader>fg", "<CMD>FzfLua grep_visual<CR>", desc = "Live grep" }
      },
      opts = {}
   },

   {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
         vim.g.gruvbox_material_enable_italic = true
         vim.cmd.colorscheme('gruvbox-material')
      end
   },

   {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = ":TSUpdate",
      event = "VeryLazy",
      lazy = vim.fn.argc(-1) == 0,
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
      config = function()
         local configs = require("nvim-treesitter.configs")

         configs.setup({
            ensure_installed = { "lua", "luadoc", "python", "vim", "vimdoc" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
         })
      end
   },

   {
      "echasnovski/mini.pairs",
      version = false,
      event = "VeryLazy",
      opts = {},
   },

   {
      "nvim-neo-tree/neo-tree.nvim",
      cmd = "Neotree",
      branch = "v3.x",
      keys = {
         {
            "<leader>e",
            function()
               require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end,
            desc = "Neotree open"
         }
      },
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim"
      },
      deactivate = function()
         vim.cmd([[Neotree close]])
      end,
      init = function()
         vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("Neotree_start_directory", {clear = true }),
            desc = "Start Neotree with directory",
            once = true,
            callback = function()
               if package.loaded["neo-tree"] then
                  return
               else
                  local stats = vim.uv.fs_stat(vim.fn.argv(0))
                  if stats and stats.type == "directory" then
                     require("neo-tree")
                  end
               end
            end,
         })
      end,
      opts = {
         filesystem = {
            bind_to_cwd = false,
            follow_current_file = {enabled = true},
            use_libus_file_watcher = true,
         },
         default_component_configs = {
            indent = {
               with_expanders = true,
               expander_collapsed = "",
               expander_expanded = "",
               expander_highlight = "NeoTreeExpander",
            },
            git_status = {
               symbols = {
                  unstaged = "󰄱",
                  staged = "󰱒",
               },
            },
         }
      },
   },
}
