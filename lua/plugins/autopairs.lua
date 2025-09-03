-- Autopairs plugin configuration

return {
	"windwp/nvim-autopairs",
	config = function()
		local remap = vim.api.nvim_set_keymap
		local npairs = require("nvim-autopairs")

		npairs.setup({ map_bs = false, map_cr = false })

		_G.MUtils = {}

		MUtils.CR = function()
			if vim.fn.pumvisible() ~= 0 then
				if vim.fn.complete_info({ "selected" }).selected ~= -1 then
					return npairs.esc("<c-y>")
				else
					return npairs.esc("<c-e>") .. npairs.autopairs_cr()
				end
			else
				return npairs.autopairs_cr()
			end
		end
		remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

		MUtils.BS = function()
			if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
				return npairs.esc("<c-e>") .. npairs.autopairs_bs()
			else
				return npairs.autopairs_bs()
			end
		end
		remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

		-- put this to setup function and press <a-e> to use fast_wrap
		npairs.setup({
			fast_wrap = {},
		})

		-- change default fast_wrap
		npairs.setup({
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		npairs.remove_rule("`")
	end,
}