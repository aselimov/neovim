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
		"Exafunction/windsurf.vim",
		event = "BufEnter",
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