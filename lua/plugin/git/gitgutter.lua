return {
	"airblade/vim-gitgutter",
	enabled = false,
	config = function()
		vim.g.gitgutter_sign_added = "+"
		vim.g.gitgutter_sign_modified = "*"
		vim.g.gitgutter_sign_removed = "x"
		vim.g.gitgutter_sign_removed_first_line = "^"
		vim.g.gitgutter_sign_modified_removed = "<"
	end
}
