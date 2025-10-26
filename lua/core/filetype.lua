vim.filetype.add({
	extension = {
		-- TERRAFORM
		-- tf = "tf",
		tidal = "tidal",
		scd   = "tidal"
	},
	filename = {
		-- TERRAFORM
		["terraform.rc"] = "terraform",
		["main.tf"] = "terra",
	},
	pattern = {
		-- TERRAFORM VAR
		["%.tfvars"] = "terraform-vars",
	},
})

vim.filetype.add({
	extension = { gotmpl = "gotmpl" },
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
	},
})
