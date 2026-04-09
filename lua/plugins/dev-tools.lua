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
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup({
				window = {
					split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
					position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
				},
				keymaps = {
					toggle = {
						normal = "<leader>cc", -- Normal mode keymap for toggling Claude Code, false to disable
						terminal = "<leader>cc", -- Terminal mode keymap for toggling Claude Code, false to disable
						variants = {
							continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
							verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
						},
					},
				},
			})
		end,
	},
}
