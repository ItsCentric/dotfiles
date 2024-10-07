require("centric")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"christoomey/vim-tmux-navigator",
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
	"ThePrimeagen/vim-be-good",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "sbdchd/neoformat" },
	{ "github/copilot.vim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-surround" },
	{
		"amitds1997/remote-nvim.nvim",
		version = "*", -- Pin to GitHub releases
		dependencies = {
			"nvim-lua/plenary.nvim", -- For standard functions
			"MunifTanjim/nui.nvim", -- To build the plugin UI
			"nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
		},
		config = true,
	},
})
vim.cmd.colorscheme("catppuccin")
