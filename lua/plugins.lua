return {
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
		config = true,
	},

	{
		'akinsho/bufferline.nvim',
		event = "BufRead",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = true,
	},

	{
		'goolord/alpha-nvim',
		dependencies = "nvim-lua/plenary.nvim",
	}
}
