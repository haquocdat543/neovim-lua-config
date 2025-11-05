-- Terraform
vim.filetype.add({
	extension = {
		-- TERRAFORM
		-- tf = "tf",
		tidal = "tidal",
		scd = "supercollider",
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

-- Helm Chart
vim.filetype.add({
	extension = { gotmpl = "gotmpl" },
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
	},
})
--
-- TidalCycles
vim.filetype.add({
	extension = {
		tidal = "tidal",
		scd = "supercollider",
	},
})
