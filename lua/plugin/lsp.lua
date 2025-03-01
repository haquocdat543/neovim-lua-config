-- terraform lsp
local signs = { Error = "e ", Warn = "w ", Hint = "h ", Info = "i " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
