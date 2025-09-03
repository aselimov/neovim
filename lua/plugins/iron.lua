-- Iron REPL plugin configuration

return {
	"Vigemus/iron.nvim",
	ft = { "python" },
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					python = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = "ipython --no-autoindent",
					},
				},
				-- How the repl window will be displayed
				-- See below for more information
				repl_open_cmd = require("iron.view").bottom(20),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				visual_send = "<leader>sc",
				send_file = "<leader>sf",
				send_line = "<leader>sl",
				cr = "<leader>s<cr>",
				interrupt = "<leader>s<space>",
				exit = "<leader>sq",
				clear = "<leader>cl",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = false, -- ignore blank lines when sending visual select lines
		})
		vim.keymap.set("n", ";rs", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", ";rr", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", ";rf", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", ";rh", "<cmd>IronHide<cr>")

		repl_open_cmd = "horizontal bot 20 split"
	end,
}