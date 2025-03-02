-- You dont need to configure lsp
-- Just need to install it and include it in ${PATH} or install it using mason
-- docker: yarn global add dockerfile-language-server-nodejs
-- terraform: go install github.com/hashicorp/terraform-ls@latest
-- bash: yarn global add bash-language-server
-- java: install [jdtls] using mason

local signs = { Error = "e ", Warn = "w ", Hint = "h ", Info = "i " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
