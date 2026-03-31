local opts = {
	noremap = true,
	silent = true,
}

----------------------------------------------------------------------------------------------------
-- System
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<C-b>b", ":set backup<CR>")
vim.keymap.set("n", "<C-h>h", ":noh<CR>", { desc = "Set no highlight" })
vim.keymap.set("n", "<C-q>q", ":q!<CR>", { desc = "Quit FORCE" })
vim.keymap.set("n", "<C-q>w", ":wq!<CR>", { desc = "Write and Quite FORCE" })

-- System - replacement & navigation
vim.keymap.set("n", "<C-c>1", ":%s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>2", ":.,.s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>3", ":.,0s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>4", ":.,$s///g<Left><Left><Left>")
vim.keymap.set("n", "<C-c>5", ":.,.-s///g<Left><Left><Left><Left><Left>")
vim.keymap.set("n", "<C-c>6", ":.,.+s///g<Left><Left><Left><Left><Left>")
vim.keymap.set("n", "<C-x>", "<C-p><CR>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>aa", ":UltiSnipsEdit<CR>", { desc = "Open Ultisnip " })
vim.keymap.set("n", "<leader>ww", ":w!<CR>", { desc = "Write to file" })
vim.keymap.set("n", "<C-s>s", ":<ESC>w!<CR>")
vim.keymap.set("n", "<A-n>n", ":n<CR>")
vim.keymap.set("n", "<A-p>p", ":p<CR>")

-- System
vim.keymap.set("n", "<leader>pa", '"*p', { desc = "Paste all from clipboard" })
vim.keymap.set("n", "<leader>ya", "gg\"*yG''", { desc = "Yank all to clipboard" })
vim.keymap.set("n", "<leader>yy", '"*yy', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>el", "yypC", { desc = "Edit next bottom line" })
vim.keymap.set("n", "<leader>eL", "yyPC", { desc = "Edit next top line" })

-- Exit
vim.keymap.set("n", "ZZ", ":wq!<CR>", { desc = "Save and Quit with FORCE" })
vim.keymap.set("n", "ZQ", ":qa<CR>", { desc = "Quit all" })

-- System
vim.keymap.set("n", ",ch", ":checkhealth ")
vim.keymap.set("n", "+", "<C-a>", { desc = "Increase number by 1" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrease number by 1" })
vim.keymap.set("n", "<C-a>", "gg<M-v>G")
vim.keymap.set("n", "<leader>hr", ":%!xxd<CR> :set filetype=xxd<CR>")
vim.keymap.set("n", "<leader>hw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>")
vim.keymap.set("n", "<leader>ra", ":call ReplaceAll")

-- Map ESC
vim.keymap.set("i", "<C-x>", "<Esc><Esc>")

-- Nvimtree - resize
-- vim.keymap.set("n", "<leader>vv", ":vertical res +5<CR>")
-- vim.keymap.set("n", "<leader>vd", ":vertical res -5<CR>")
-- vim.keymap.set("n", "<leader>hh", ":horizontal res +5<CR>")
-- vim.keymap.set("n", "<leader>hd", ":horizontal res -5<CR>")

-- System - commands
vim.keymap.set("n", "<leader>rg", ":registers<CR>", { desc = "Registers" })

-- Terminal
-- vim.keymap.set("n", "<leader>tn", ":split<CR><C-w>w:term<CR>i")
-- vim.keymap.set("n", "<leader>tm", ":split<CR><C-w>w:horizontal resize -10<CR>:term<CR>i",
-- 	{ desc = "Open terminal at bottom" })

-- Diff
-- vim.keymap.set("n", "<leader>dd", ":windo diffthis<CR>", { desc = "Diff these" })
-- vim.keymap.set("n", "<leader>do", ":diffoff!<CR>", { desc = "Diff close" })

-- System - default file open
vim.keymap.set("n", "<leader>nn", ":set nopaste<CR>", { desc = "Set no paste" })
vim.keymap.set("n", "<leader>nm", ":set paste<CR>", { desc = "Set paste" })

-- System - navigation
vim.keymap.set("n", "ss", ":split<CR>C-w>w", { desc = "Split tab horizontally" })
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", { desc = "Split tab vertically" })
vim.keymap.set("n", "sx", ":close<CR>", { desc = "Split close" })
vim.keymap.set("n", "sl", ":wincmd l<CR>", { desc = "Go to left split" })
vim.keymap.set("n", "sh", ":wincmd h<CR>", { desc = "Go to right split" })
vim.keymap.set("n", "sj", ":wincmd j<CR>", { desc = "Go to bottom split" })
vim.keymap.set("n", "sk", ":wincmd k<CR>", { desc = "Go to top split" })

-- System - tab navigation
vim.keymap.set("n", "<leader>te", ":tabedit ", { desc = "Edit tab" })
vim.keymap.set("n", "<leader>to", ":tabnew ", { desc = "Tab new" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Tab close" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Tab next" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Tab previous" })
vim.keymap.set("n", "<leader>ev", ":tabnew ${MYVIMRC}<CR>", { desc = "Edit ${MYVIMRC}" })
vim.keymap.set("n", "<leader>ec", ":tabnew ${HOME}/.ssh/config<CR>", { desc = "Edit ssh config" })
vim.keymap.set("n", "<leader>ev", ":tabnew ${HOME}/.vimrc<CR>", { desc = "Edit home .vimrc" })
vim.keymap.set("n", "<leader>ea", ":tabnew ${HOME}/.bashrc<CR>", { desc = "Edit home .bashrc" })
vim.keymap.set("n", "<leader>cr", ":tabnew ${HOME}/.aws/credentials<CR>", { desc = "Edit aws credentials" })
vim.keymap.set("n", "<leader>cf", ":tabnew ${HOME}/.aws/config<CR>", { desc = "Edit aws configuration" })

----------------------------------------------------------------------------------------------------
-- Lazy
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>", { desc = "Open lazy" })

----------------------------------------------------------------------------------------------------
-- Reload
----------------------------------------------------------------------------------------------------
-- vim.keymap.set("n", "<leader>0", ":source $MYVIMRC<CR>")
