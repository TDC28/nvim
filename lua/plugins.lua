return {
	{
		"lervag/vimtex",
		lazy = false,
		config = function() end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("configs.alpha_config")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		config = function()
			require("configs.cmp_config")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = function()
			require("gitsigns").setup({
				numhl = true,
				signcolumn = false,
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"akinsho/bufferline.nvim",
		event = "BufEnter",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "BufEnter",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "InsertEnter",
		main = "ibl",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter_config")
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "InsertEnter",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "InsertEnter",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "InsertEnter",
	},
	{
		"stevearc/conform.nvim",
		event = "BufEnter",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					bash = { "shfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.lualine_config")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
}
