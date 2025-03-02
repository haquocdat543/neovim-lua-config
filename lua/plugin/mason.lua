local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local lsps = {
	"lua_ls",
	"ts_ls",
	"dockerls",
	"yamlls",
	"jdtls",
	"jsonls",
	"gopls",
	"rust_analyzer",
}

mason.setup()
mason_lspconfig.setup({
	ensure_installed = lsps,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
end

local servers = mason_lspconfig.get_installed_servers()

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
