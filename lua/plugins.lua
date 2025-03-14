return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            local colors = {
                bg = "#282828",
                red = "#cc241d",
                orange = "#d65d0e",
                blue = "#458588",
                green = "#b8bb26",
                yellow = "#fabd2f",
                bg0_h = "#1d2021",
                fg = "#ebdbb2",
            }

            local theme = {
                normal = {
                    a = { bg = colors.bg, fg = colors.fg },
                    b = { bg = colors.bg0_h, fg = colors.fg },
                    c = { bg = colors.bg0_h, fg = colors.fg },
                },
                insert = { a = { bg = colors.green, fg = colors.bg } },
                visual = { a = { bg = colors.orange, fg = colors.fg } },
                replace = { a = { bg = colors.red, fg = colors.fg } },
                command = { a = { bg = colors.yellow, fg = colors.bg } },
                terminal = { a = { bg = colors.blue, fg = colors.fg } },
            }

            local mode = {
                "mode",
                separator = { right = "" },
            }

            local space = {
                color = { bg = colors.bg0_h, fg = colors.bg0_h, gui = "bold" },
                function()
                    return " "
                end,
            }

            local vim_icon = {
                function()
                    return ""
                end,
                separator = { left = "", right = "" },
            }

            local filename = {
                "filename",
                color = { fg = colors.fg, gui = "bold" },
                separator = { left = "", right = "" },
                padding = 0,
            }

            local filetype = {
                "filetype",
                icon_only = true,
                colored = true,
                separator = { right = "" },
                padding = 0,
            }

            local branch = {
                "branch",
                icon = "",
                separator = { left = "", right = "" },
            }

            local diff = {
                "diff",
                separator = { left = "", right = "" },
            }

            local dia = {
                "diagnostics",
                color = { bg = colors.bg0_h, fg = colors.fg },
                separator = { left = "", right = "" },
            }

            local progress = {
                function()
                    return string.format("%d%%%%/%d", vim.fn.line("."), vim.fn.line("$"))
                end,
                color = { bg = colors.bg0_h, fg = colors.fg },
                separator = { left = "", right = "" },
            }

            local encoding = {
                "encoding",
                color = { bg = colors.bg0_h, fg = colors.fg },
                separator = { left = "", right = "" },
            }

            local opts = {
                options = { globalstatus = true, theme = theme, component_separators = "", section_separators = "" },
                sections = {
                    lualine_a = { vim_icon, mode },
                    lualine_b = { space },
                    lualine_c = { filetype, filename, space, branch, diff },
                    lualine_x = { space },
                    lualine_y = { space },
                    lualine_z = { dia, encoding, progress },
                },
            }

            return opts
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
        },
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        event = { "BufWritePre" },
        cmd = "ConformInfo",
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
                python = { "isort", "black" },
                json = { "prettierd" },
            },
        },
    },

    {
        "akinsho/bufferline.nvim",
        -- event = "BufAdd",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
            { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        },
        opts = {
            highlights = {
                fill = {
                    bg = "#161818",
                },
                offset_separator = {
                    bg = "#1d2021",
                },
                buffer_selected = {
                    italic = false,
                },
            },
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "",
                        highlight = "Directory",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
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
                        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                        return vim_item
                    end,
                },
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
                    { name = "lazydev" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },

    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "bashls", "jsonls" },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
            })
        end,
    },

    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>FzfLua grep_visual<cr>", desc = "Live grep" },
            { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Commits" },
            { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command history" },
        },
        opts = {},
    },

    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"

            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    SignColumn = { link = "Normal" },
                    GruvboxGreenSign = { bg = "" },
                    GruvboxOrangeSign = { bg = "" },
                    GruvboxPurpleSign = { bg = "" },
                    GruvboxYellowSign = { bg = "" },
                    GruvboxRedSign = { bg = "" },
                    GruvboxBlueSign = { bg = "" },
                    GruvboxAquaSign = { bg = "" },
                },
                dim_inactive = false,
                transparent_mode = false,
            })

            vim.cmd("colorscheme gruvbox")
        end,
    },

    -- {
    --    "sainnhe/gruvbox-material",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --       vim.g.gruvbox_material_enable_italic = true
    --       vim.g.gruvbox_material_background = "hard"
    --       vim.g.gruvbox_material_foreground = "original"
    --       vim.cmd.colorscheme("gruvbox-material")
    --    end,
    -- },

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
                ensure_installed = {
                    "lua",
                    "luadoc",
                    "python",
                    "vim",
                    "vimdoc",
                    "bash",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
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
                desc = "Neotree open",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        deactivate = function()
            vim.cmd([[Neotree close]])
        end,
        init = function()
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
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
                follow_current_file = { enabled = true },
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
            },
        },
    },
}
