-- You dont need to configure lsp
-- Just need to install it and include it in ${PATH} or install it using mason
-- docker: npm i -g dockerfile-language-server-nodejs
-- terraform: go install github.com/hashicorp/terraform-ls@latest
-- bash: npm i -g bash-language-server
-- java: install [jdtls] using mason
-- yaml: npm i -g yaml-language-server

-- require("lspconfig").yamlls.setup({
-- settings = {
-- yaml = {
-- format = {
-- enable = true,
-- },
-- },
-- },
-- })

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"onsails/lspkind.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	config = function()
		require("lspconfig").terraformls.setup({
			filetypes = {
				"terraform",
				"hcl",
				"tf"
			}, -- Include HCL
			on_attach = function(client, bufnr)
				-- Enable formatting
				client.server_capabilities.documentFormattingProvider = true
			end,
		})

		local signs = {
			Error = "e ",
			Warn = "w ",
			Hint = "h ",
			Info = "i "
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
