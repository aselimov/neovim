-- Formatting plugins

return {
	{
		"stevearc/conform.nvim",
		setup = {
			formatters = {
				black = {
					command = "black",
					prepend_args = { "--line-length", "100" },
				},
				"prettier",
				formatters = {
					golines = {
						args = {
							"--max-len=100",
							"--base-formatter=gofmt",
						},
					},
				},
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 2500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				sh = { "beautysh" },
				tex = { "latexindent" },
				java = { "java" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				go = { "golines" },
			},
		},
	},
}
