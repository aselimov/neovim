-- Completion and snippets configuration

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				config = function()
					require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })
					local ls = require("luasnip")
					local snip = ls.snippet
					local node = ls.snippet_node
					local text = ls.text_node
					local insert = ls.insert_node
					local func = ls.function_node
					local choice = ls.choice_node
					local dynamicn = ls.dynamic_node

					ls.add_snippets(nil, {
						python = {
							snip({
								trig = "imp",
								namr = "Imports",
								dscr = "Comments for imports",
							}, {
								text({ "# Core modules", "" }),
								insert(1),
								text({ "", "# Non-core modules", "" }),
								insert(2),
								text({ "", "# SEI modules", "" }),
								insert(3),
							}),
						},
						tex = {
							snip({
								trig = "input",
								namr = "Input Cell",
								dscr = "Cell for SEIInputTable",
							}, {
								text({ "\\hypertarget{" }),
								insert(1),
								text({ "}{" }),
								insert(2),
								text({ "} & \\SEICell{", "\t" }),
								insert(3),
								text({ "", "}\\\\", "" }),
							}),
						},
						markdown = {
							snip({
								trig = "img",
								namr = "image",
								dscr = "Markdown img",
							}, {
								text({ "![" }),
								insert(1),
								text("]("),
								insert(2),
								text(")"),
							}),
							snip({
								trig = "header",
								namr = "header",
								dscr = "Yaml header for markdown notes",
							}, {
								text({ "---", "" }),
								text("title: "),
								insert(1),
								text({ "", "author: Alex Selimov", "" }),
								text("tags: ["),
								insert(2),
								text({ "]", "", "" }),
								text({ "---", "" }),
							}),
						},
					})
				end,
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					["<leader>j"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<leader>k"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
		snippet = {
			expand = function(args)
				local luasnip = require("luasnip")
				if not luasnip then
					return
				end
				luasnip.lsp_expand(args.body)
			end,
		},
	},
}