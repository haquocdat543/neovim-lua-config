return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		-- import nvim-cmp plugin safely
		local cmp_status, cmp = pcall(require, "cmp")
		if not cmp_status then
			return
		end

		-- import luasnip plugin safely
		local luasnip_status, luasnip = pcall(require, "luasnip")
		if not luasnip_status then
			return
		end

		-- import lspkind plugin safely
		local lspkind_status, lspkind = pcall(require, "lspkind")
		if not lspkind_status then
			return
		end

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		cmp.setup({
			formatting = {
				-- order of columns in completion menu
				fields = { "abbr", "menu", "icon", "kind" },

				-- function to format each item
				format = lspkind.cmp_format({
					mode = 'symbol', -- only show the icon
					maxwidth = 50, -- optional: truncate long items
					ellipsis_char = '…',
					before = function(entry, vim_item)
						-- Set menu to show the source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							path = "[Path]",
							luasnip = "[Snip]",
						})[entry.source.name]
						return vim_item
					end
				}),
			},

			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
				}),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({

				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<C-b>"] = cmp.mapping.complete({}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end,
					{
						"i",
						"s",
					}
				),

				["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
					{
						"i",
						"s",
					}
				),
			}),

			sources = {
				{
					name = "luasnip",
				},
				{
					name = "nvim_lsp",
				},
				{
					name = "buffer",
				},
				{
					name = "nvim_lua",
				},
				{
					name = "path",
				},
			},
		})
	end,
}
