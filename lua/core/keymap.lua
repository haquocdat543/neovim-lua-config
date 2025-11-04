local opts = {
	noremap = true,
	silent = true,
}

----------------------------------------------------------------------------------------------------
-- System
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<C-b>b", ":set backup<CR>")
vim.keymap.set("n", "<C-h>h", ":noh<CR>")
vim.keymap.set("n", "<C-q>q", ":q!<CR>")
vim.keymap.set("n", "<C-q>w", ":wq!<CR>")

-- System - replacement & navigation
vim.keymap.set("n", "<C-c>1", ":%s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>2", ":.,.s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>3", ":.,0s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>4", ":.,$s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>5", ":.,.-s///g<Left><Left><Left><Left><Left>")
vim.keymap.set("n", "<C-c>6", ":.,.+s///g<Left><Left><Left><Left><Left>")
vim.keymap.set("n", "<C-x>", "<C-p><CR>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<leader>aa", ":UltiSnipsEdit<CR>")
vim.keymap.set("n", "<leader>ww", ":w!<CR>")
vim.keymap.set("n", "<C-s>s", ":<ESC>w!<CR>")
vim.keymap.set("n", "<A-n>n", ":n<CR>")
vim.keymap.set("n", "<A-p>p", ":p<CR>")

-- System
vim.keymap.set("n", "<leader>pa", '"*p')
vim.keymap.set("n", "<leader>ya", "gg\"*yG''")
vim.keymap.set("n", "<leader>yy", '"*yy')
vim.keymap.set("n", "<leader>el", "yypC")
vim.keymap.set("n", "<leader>eL", "yyPC")

-- Exit
vim.keymap.set("n", "ZZ", ":wq!<CR>")
vim.keymap.set("n", "ZQ", ":qa<CR>")

-- System
vim.keymap.set("n", ",ch", ":checkhealth ")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<C-a>", "gg<M-v>G")
vim.keymap.set("n", "<leader>hr", ":%!xxd<CR> :set filetype=xxd<CR>")
vim.keymap.set("n", "<leader>hw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>")
vim.keymap.set("n", "<leader>el", "yypC")
vim.keymap.set("n", "<leader>eL", "yyPC")
vim.keymap.set("n", "<leader>ra", ":call ReplaceAll")

-- Map ESC
vim.keymap.set("i", "<C-x>", "<Esc><Esc>")

-- Nvimtree - resize
vim.keymap.set("n", "<leader>vv", ":vertical res +5<CR>")
vim.keymap.set("n", "<leader>vd", ":vertical res -5<CR>")
vim.keymap.set("n", "<leader>hh", ":horizontal res +5<CR>")
vim.keymap.set("n", "<leader>hd", ":horizontal res -5<CR>")

-- System - commands
vim.keymap.set("n", "<leader>rg", ":registers<CR>")

-- Terminal
vim.keymap.set("n", "<leader>tn", ":split<CR><C-w>w:term<CR>i")
vim.keymap.set("n", "<leader>tm", ":split<CR><C-w>w:horizontal resize -10<CR>:term<CR>i")

-- Diff
vim.keymap.set("n", "<leader>dd", ":windo diffthis<CR>")
vim.keymap.set("n", "<leader>do", ":diffoff!<CR>")

-- System - default file open
vim.keymap.set("n", "<leader>en", ":tabnew ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>ev", ":tabnew ~/.vimrc<CR>")
vim.keymap.set("n", "<leader>ea", ":tabnew ~/.bashrc<CR>")
vim.keymap.set("n", "<leader>ec", ":tabnew ~/.ssh/config<CR>")
vim.keymap.set("n", "<leader>sc", ":tabnew ~/Suitcase/bash/scripts/BasicCalculator.sh<CR>")
vim.keymap.set("n", "<leader>sn", ":tabnew ~/Suitcase/snippets/sh.snippets<CR>")
vim.keymap.set("n", "<leader>nn", ":set nopaste<CR>")
vim.keymap.set("n", "<leader>nm", ":set paste<CR>")

-- System - navigation
vim.keymap.set("n", "ss", ":split<CR>C-w>w")
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w")
vim.keymap.set("n", "sx", ":close<CR>")
vim.keymap.set("n", "sw", ":wincmd w<CR>")
vim.keymap.set("n", "sl", ":wincmd l<CR>")
vim.keymap.set("n", "sh", ":wincmd h<CR>")
vim.keymap.set("n", "sj", ":wincmd j<CR>")
vim.keymap.set("n", "sk", ":wincmd k<CR>")

-- System - tab navigation
vim.keymap.set("n", "<leader>te", ":tabedit ")
vim.keymap.set("n", "<leader>to", ":tabnew ")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
vim.keymap.set("n", "<leader>ev", ":tabnew $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>ea", ":tabnew $HOME/.bashrc<CR>")
vim.keymap.set("n", "<leader>cr", ":tabnew $HOME/.aws/credentials<CR>")
vim.keymap.set("n", "<leader>cf", ":tabnew $HOME/.aws/config<CR>")

----------------------------------------------------------------------------------------------------
-- Snippet
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>sg", ":Snippets<CR>") -- sg = Suggest

----------------------------------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ft", ":FloatermNew<CR>")
vim.keymap.set("n", "<leader>tt", ":terminal<CR>")

----------------------------------------------------------------------------------------------------
-- Lazy
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>")

----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- LSP
----------------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		vim.keymap.set("n", "<leader>lp", ":LspStop<CR>")
		vim.keymap.set("n", "<leader>ls", ":LspStart<CR>")
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", { desc = "Rename Symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		vim.keymap.set("n", "ca", ":Lspsaga code_action<CR>")
		vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>")
		vim.keymap.set("n", "<leader>pd", ":Lspsaga peek_definition<CR>")
		vim.keymap.set("n", "<leader>fd", ":Lspsaga finder<CR>")
		vim.keymap.set("n", "<leader>sd", ":Lspsaga show_buf_diagnostics<CR>")
		vim.keymap.set("n", "<leader>ol", ":Lspsaga outline<CR>")
		vim.keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>")
		vim.keymap.set("n", "<leader>wt", ":Lspsaga winbar_toggle<CR>")
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
		vim.keymap.set("n", "<leader>fc", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format Code" })

		vim.keymap.set("n", "<leader>ab", function()
			local clients = vim.lsp.get_active_clients()
			if #clients == 0 then
				print("No active LSP clients")
				return
			end

			local capabilities = vim.inspect(clients[1].server_capabilities)

			-- Display in a floating window
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(capabilities, "\n"))

			local width = math.min(80, vim.o.columns - 4)
			local height = math.min(20, vim.o.lines - 4)

			local options = {
				relative = "editor",
				width = width,
				height = height,
				row = (vim.o.lines - height) / 2,
				col = (vim.o.columns - width) / 2,
				style = "minimal",
				border = "rounded",
			}

			vim.api.nvim_open_win(buf, true, options)
		end, { desc = "Show LSP Capabilities" })
	end,
})
----------------------------------------------------------------------------------------------------
-- Format
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>fm", ":Format<CR>")
