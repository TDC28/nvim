return {
	{
		"neovim/nvim-lspconfig",
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
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = require("config.lualine")
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
		dependencies = { 'nvim-lua/plenary.nvim'},
	},

	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			-- helper function for utf8 chars
			local function getCharLen(s, pos)
				local byte = string.byte(s, pos)
				if not byte then
					return nil
				end
				return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
			end

			local function applyColors(logo, colors, logoColors)
				dashboard.section.header.val = logo

				for key, color in pairs(colors) do
					local name = "Alpha" .. key
					vim.api.nvim_set_hl(0, name, color)
					colors[key] = name
				end

				dashboard.section.header.opts.hl = {}
				for i, line in ipairs(logoColors) do
					local highlights = {}
					local pos = 0

					for j = 1, #line do
						local opos = pos
						pos = pos + getCharLen(logo[i], opos + 1)

						local color_name = colors[line:sub(j, j)]
						if color_name then
							table.insert(highlights, { color_name, opos, pos })
						end
					end

					table.insert(dashboard.section.header.opts.hl, highlights)
				end
				return dashboard.opts
			end

			require("alpha").setup(applyColors({
				[[  ███       ███  ]],
				[[  ████      ████ ]],
				[[  ████     █████ ]],
				[[ █ ████    █████ ]],
				[[ ██ ████   █████ ]],
				[[ ███ ████  █████ ]],
				[[ ████ ████ ████ ]],
				[[ █████  ████████ ]],
				[[ █████   ███████ ]],
				[[ █████    ██████ ]],
				[[ █████     █████ ]],
				[[ ████      ████ ]],
				[[  ███       ███  ]],
				[[                    ]],
				[[  N  E  O  V  I  M  ]],
			}, {
				["b"] = { fg = "#3399ff", ctermfg = 33 },
				["a"] = { fg = "#53C670", ctermfg = 35 },
				["g"] = { fg = "#39ac56", ctermfg = 29 },
				["h"] = { fg = "#33994d", ctermfg = 23},
				["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29},
				["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
				["k"] = { fg = "#30A572", ctermfg = 36},
			}, {
				[[  kkkka       gggg  ]],
				[[  kkkkaa      ggggg ]],
				[[ b kkkaaa     ggggg ]],
				[[ bb kkaaaa    ggggg ]],
				[[ bbb kaaaaa   ggggg ]],
				[[ bbbb aaaaaa  ggggg ]],
				[[ bbbbb aaaaaa igggg ]],
				[[ bbbbb  aaaaaahiggg ]],
				[[ bbbbb   aaaaajhigg ]],
				[[ bbbbb    aaaaajhig ]],
				[[ bbbbb     aaaaajhi ]],
				[[ bbbbb      aaaaajh ]],
				[[  bbbb       aaaaa  ]],
				[[                    ]],
				[[  a  a  a  b  b  b  ]],
			}))
		end,
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
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
