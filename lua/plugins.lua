return {
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = true,
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && npm install",
	-- 	init = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- },
	{
		"lervag/vimtex",
		ft = "tex",
		init = function()
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_syntax_enabled = 0
		end,
	},
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
					"ts_ls",
					"tailwindcss",
					"pyright",
					"clangd",
				},
			})
			require("config.lsp")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		build = ":TSUpdate",
		event = "BufRead",
		config = function()
			require("config.treesitter")
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
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
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
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
			{ "<c-h>", "<CMD><C-U>TmuxNavigateLeft<CR>" },
			{ "<c-j>", "<CMD><C-U>TmuxNavigateDown<CR>" },
			{ "<c-k>", "<CMD><C-U>TmuxNavigateUp<CR>" },
			{ "<c-l>", "<CMD><C-U>TmuxNavigateRight<CR>" },
			{ "<c-\\>", "<CMD><C-U>TmuxNavigatePrevious<CR>" },
		},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		config = true,
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
		},
		config = function()
			require("config.cmp")
		end,
	},

	{
		"OXY2DEV/helpview.nvim",
		lazy = false,

		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre",
		config = true,
	},
}
