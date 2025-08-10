return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		local utils = {}

		function utils.merge_lists(...)
			local result = {}
			for _, list in ipairs({ ... }) do
				for _, item in ipairs(list) do
					table.insert(result, item)
				end
			end
			return result
		end

		local lsps = {
			"tailwindcss",
			"gitlab_ci_ls",
			"lua_ls",
			"ts_ls",
			"dockerls",
			"yamlls",
			"jdtls",
			"jsonls",
			"bashls",
			"gopls",
			"rust_analyzer",
			"terraformls",
			"zls",
			"zk",
			"ltex",
			"lemminx",
			"pylsp",
			"csharp_ls",
			"phpactor",
			"html",
			"cssls",
			"marksman",
			"cmake",
			"clangd",
			"emmet_language_server",
			"elixirls",
			"vue_ls",
			"nginx_language_server",
			"svelte",
			"angularls",
			"ruby_lsp",
			"rnix",
			"clojure_lsp",
		}

		local formatters = {
			"ast_grep",
			"black",
			"csharpier",
			"hclfmt",
			"jq",
			"prettier",
			"prettierd",
			"shfmt",
			"stylua",
		}

		local daps = {
			"codelldb",
			"elixirls",
		}

		local linters = {
			"shellcheck",
			"actionlint",
			"ast_grep",
			"eslint_d",
			"flake8",
			"golangci-lint",
			"luacheck",
			"yamllint",
		}

		mason.setup()
		mason_lspconfig.setup()

		require("mason-tool-installer").setup({
			ensure_installed = utils.merge_lists(lsps, formatters, daps, linters),
			auto_update = false, -- Optional: auto-update tools
			run_on_start = true, -- Install missing tools at startup
			start_delay = 3000, -- Delay (ms) before installation starts
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			local opts = {
				noremap = true,
				silent = true,
				buffer = bufnr,
			}
			client.server_capabilities.documentFormattingProvider = true
		end

		local servers = mason_lspconfig.get_installed_servers()

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		vim.lsp.config("terraformls", {
			filetypes = {
				"tf",
				"hcl",
				"terra",
				"terraform",
			},
			settings = {
				terraform = {
					experimentalFeatures = {
						prefillRequiredFields = true,
						validateOnSave = true,
					},
				},
			},
		})

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					codeLens = {
						enable = true,
					},
				},
			},
		})

		require("lspconfig").tailwindcss.setup({
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"astro",
			},
			-- optionally, override root_dir if necessary:
			-- root_dir = require('lspconfig').util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'postcss.config.js', 'package.json', '.git'),
		})

		require("lspconfig").emmet_language_server.setup({
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"astro",
			},
		})

		local home = os.getenv("HOME")

		require("lspconfig").jdtls.setup({
			cmd = {
				"java",
				"-javaagent:" .. home .. "/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				home
					.. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
				"-configuration",
				home .. "/.local/share/nvim/mason/packages/jdtls/config_mac", -- or config_mac_arm for Apple Silicon
				"-data",
				home .. "/.cache/jdtls/workspace",
			},
			root_dir = require("lspconfig.util").root_pattern("pom.xml", ".git"),
			settings = {
				java = {
					saveActions = {
						cleanup = true,
						organizeImports = true,
					},
				},
			},
		})
	end,
}
