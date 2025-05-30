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
			"volar",
		}

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = lsps,
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

		require 'lspconfig'.tailwindcss.setup {
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
		}

		require 'lspconfig'.emmet_language_server.setup {
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
		}

	end,
}
