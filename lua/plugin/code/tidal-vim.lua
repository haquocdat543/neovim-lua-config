return {
	"tidalcycles/vim-tidal",
	vim.keymap.set("n", "<leader>0", ":TidalSend<CR>"),
	vim.keymap.set("n", "<leader>-", ":TidalHush<CR>"),
}
