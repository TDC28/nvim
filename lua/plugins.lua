return {
   {
      "ibhagwan/fzf-lua",
      cmd = "FzfLua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
         { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
         { "<leader>fg", "<cmd>FzfLua grep_visual<CR>", desc = "Live grep" }
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
      opts_extend = { "ensure_installed"},
      opts = {
         highlight = { enable = true },
         indent = { enable = true },
         ensure_installed = {
            "bash",
            "json",
            "lua",
            "luadoc",
            "python",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
         }
      }
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
      },
   },
}
