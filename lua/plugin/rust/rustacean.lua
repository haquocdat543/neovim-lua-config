return {
	"mrcjkb/rustaceanvim",
	enabled = true,
	version = "^8", -- Recommended
	lazy = false,  -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
			},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					-- you can also put keymaps in here
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						procMacro = {
							enable = true,
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
					},
				},
			},
			-- DAP configuration
			dap = {
			},
		}
		vim.api.nvim_create_autocmd(
			{
				"BufRead",
			},
			{
				pattern = "*.rs",
				callback = function()
					vim.keymap.set("n", "<leader>rr", "<CMD>RustRun<CR>", { desc = "Run Rust" })
				end,
			}
		)
	end
}
