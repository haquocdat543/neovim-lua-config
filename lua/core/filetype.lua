vim.filetype.add({
	extension = {
		-- TERRAFORM
		-- tf = "tf",
	},
	filename = {
		-- TERRAFORM
		["terraform.rc"] = "terraform",
	},
	pattern = {
		-- TERRAFORM VAR
		["%.tfvars"] = "terraform-vars",
	},
})
