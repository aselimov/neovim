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
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				sh = { "beautysh" },
				tex = { "latexindent" },
				java = { "java" },
			},
		},
	},
}