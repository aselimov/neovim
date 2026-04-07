-- Formatting plugins

return {
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 2500,
				lsp_fallback = true,
			},
			formatters = {
				black = {
					prepend_args = { "--line-length", "100" },
				},
				beautysh = {
					prepend_args = { "--indent-size", "2" },
				},
				golines = {
					prepend_args = {
						"--max-len=100",
						"--base-formatter=gofmt",
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				sh = { "beautysh" },
				tex = { "latexindent" },
				java = { "google-java-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				go = { "golines" },
			},
		},
	},
}
