return {
	"SirVer/ultisnips",
	config = function()
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsListSnippets = "<c-y>"
		vim.g.UltiSnipsJumpForwardTrigger = "<CR>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<C-n>n"
		vim.g.UltiSnipsEditSplit = "vertical"
		vim.g.UltiSnipsSnippetDirectories = { "~/snippet" }
	end,
	keys = {

		{
			"<leader>sg",
			"<CMD>Snippets<CR>",
		},
	},
}
