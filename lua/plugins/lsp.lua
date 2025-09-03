-- LSP configuration

return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local jdtls = require("jdtls")

			-- Find project root
			local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })

			-- Path to your exported Eclipse/IntelliJ style xml
			local style_path = vim.fn.expand("~/.config/nvim/GoogleStyle.xml")

			local config = {
				cmd = { "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "--add-modules=ALL-SYSTEM", "--add-opens", "java.base/java.util=ALL-UNNAMED", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "-jar", vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"), "-configuration", vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_mac"), "-data", vim.fn.expand("~/.cache/jdtls-workspace/") .. "/" .. root_dir:gsub(":", "_") },
				root_dir = root_dir,
				settings = {
					java = {
						format = {
							settings = {
								url = "file://" .. style_path,
								profile = "GoogleStyle", -- must match the profile inside the xml
							},
						},
					},
				},
			}

			jdtls.start_or_attach(config)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("<leader>I", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				clangd = {
					filetypes = {
						"c",
						"cpp",
					},
				},
				taplo = {},
				yamlls = { settings = { yaml = { format = { enable = false } } } },
				pyright = {},
				fortls = {},
				jsonls = {},
				bashls = { dependencies = "shellcheck" },
				kotlin_language_server = {},
				ts_ls = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							rustfmt = {
								extraArgs = { "+nightly" },
							},
						},
					},
				},
				arduino_language_server = {},
				ltex = {
					settings = {
						ltex = {
							enabled = { "latex", "tex", "bib", "markdown" },
							language = "auto",
							diagnosticSeverity = "information",
							sentenceCacheSize = 2000,
							latex = {
								commands = {
									["\\hypertarget"] = "dummy",
								},
							},
							dictionary = (function()
								local files = {}
								for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
									local lang = vim.fn.fnamemodify(file, ":t:r")
									local fullpath = vim.fs.normalize(file, ":p")
									files[lang] = { ":" .. fullpath }
								end

								if files.default then
									for lang, _ in pairs(files) do
										if lang ~= "default" then
											vim.list_extend(files[lang], files.default)
										end
									end
									files.default = nil
								end
								return files
							end)(),
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"jdtls",
				"stylua",
				"black",
				"clang-format",
				"beautysh",
				"latexindent",
				"prettier",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						require("lspconfig")[server_name].setup({
							cmd = server.cmd,
							on_init = function(client)
								client.offset_encoding = "utf-8"
							end,
							settings = server.settings,
							filetypes = server.filetypes,
							capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
						})
					end,
				},
			})
		end,
	},
}