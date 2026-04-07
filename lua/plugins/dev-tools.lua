-- Development tools and utilities

return {
	{
		"codersauce/runst.nvim",
		lazy = false,
		opts = {},
		config = function()
			require("runst").setup()
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	{
		"cdelledonne/vim-cmake",
		cond = vim.fn.executable("cmake") == 1,
	},

	{
		"f-person/git-blame.nvim",
		opts = {
			enabled = false,
			message_template = "<<sha>> • <author> • <summary> • <date>",
		},
	},

	{
		"Exafunction/windsurf.vim",
		event = "BufEnter",
		cond = os.getenv("NVIM_USE_WINDSURF") == "true",
	},

	{
		"danymat/neogen",
		setup = {
			snippet_engine = "luasnip",
		},
		config = function()
			require("neogen").setup({})
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<Leader>dg", ":lua require('neogen').generate()<CR>", opts)
		end,
		version = "*",
	},
}
