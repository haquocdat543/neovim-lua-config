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
-- Lazy
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>")

----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Format
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>fm", ":Format<CR>")
