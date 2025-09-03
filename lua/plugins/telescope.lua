-- Telescope fuzzy finder configuration

return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
				path_display = { "smart" },
			}),
		})

		pcall(require("telescope").load_extension("live_grep_args"))
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-g>", require("telescope").extensions.live_grep_args.live_grep_args)
		vim.keymap.set(
			"x",
			"<C-g>",
			"\"zy:lua require('telescope').extensions.live_grep_args.live_grep_args(require('telescope.themes').get_ivy({}))<cr><c-r>z"
		)
		vim.keymap.set("n", "<C-f>", builtin.find_files)
	end,
}