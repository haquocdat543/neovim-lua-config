local keymap = vim.keymap
local opts = { noremap = true, silent = true }

----------------------------------------------------------------------------------------------------
-- System
----------------------------------------------------------------------------------------------------
keymap.set("n", "<C-b>b", ":set backup<CR>")
keymap.set("n", "<C-h>h", ":noh<CR>")
keymap.set("n", "<C-q>q", ":q!<CR>")
keymap.set("n", "<C-q>w", ":wq!<CR>")

-- System - replacement & navigation
keymap.set("n", "<C-c>1", ":%s///g<Left><Left><Left>")
keymap.set("n", "<C-c>2", ":.,.s///g<Left><Left><Left>")
keymap.set("n", "<C-c>3", ":.,0s///g<Left><Left><Left>")
keymap.set("n", "<C-c>4", ":.,$s///g<Left><Left><Left>")
keymap.set("n", "<C-c>5", ":.,.-s///g<Left><Left><Left><Left><Left>")
keymap.set("n", "<C-c>6", ":.,.+s///g<Left><Left><Left><Left><Left>")
keymap.set("n", "<C-x>", "<C-p><CR>")
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("n", "<leader>aa", ":UltiSnipsEdit<CR>")
keymap.set("n", "<leader>ww", ":w!<CR>")
keymap.set("n", "<C-s>s", ":<ESC>w!<CR>")
keymap.set("n", "<A-n>n", ":n<CR>")
keymap.set("n", "<A-p>p", ":p<CR>")

-- System
keymap.set("n", "<leader>pa", '"*p')
keymap.set("n", "<leader>ya", "gg\"*yG''")
keymap.set("n", "<leader>yy", '"*yy')
keymap.set("n", "<leader>el", "yypC")
keymap.set("n", "<leader>eL", "yyPC")

-- System
keymap.set("n", ",ch", ":checkhealth ")
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<C-a>", "gg<M-v>G")
keymap.set("n", "ZQ", ":q!<CR>")
keymap.set("n", "ZZ", ":wq!<CR>")
keymap.set("n", "<leader>hr", ":%!xxd<CR> :set filetype=xxd<CR>")
keymap.set("n", "<leader>hw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>")
keymap.set("n", "<leader>el", "yypC")
keymap.set("n", "<leader>eL", "yyPC")
keymap.set("n", "<leader>ra", ":call ReplaceAll")

-- Map ESC
keymap.set("i", "<C-x>", "<Esc><Esc>")

-- Nvimtree - resize
keymap.set("n", "<leader><leader>v", ":vertical res ")

-- System - commands
keymap.set("n", "<leader>rg", ":registers<CR>")

-- Terminal
keymap.set("n", "<leader>tn", ":split<CR><C-w>w:term<CR>i")
keymap.set("n", "<leader>tm", ":split<CR><C-w>w:horizontal resize -10<CR>:term<CR>i")

-- Diff
keymap.set("n", "<leader>dd", ":windo diffthis<CR>")
keymap.set("n", "<leader>do", ":diffoff!<CR>")

-- System - default file open
keymap.set("n", "<leader>en", ":tabnew ~/.config/nvim/init.lua<CR>")
keymap.set("n", "<leader>ev", ":tabnew ~/.vimrc<CR>")
keymap.set("n", "<leader>ea", ":tabnew ~/.bashrc<CR>")
keymap.set("n", "<leader>ec", ":tabnew ~/.ssh/config<CR>")
keymap.set("n", "<leader>sc", ":tabnew ~/Suitcase/bash/scripts/BasicCalculator.sh<CR>")
keymap.set("n", "<leader>sn", ":tabnew ~/Suitcase/snippets/sh.snippets<CR>")
keymap.set("n", "<leader>nn", ":set nopaste<CR>")
keymap.set("n", "<leader>nm", ":set paste<CR>")

-- System - navigation
keymap.set("n", "ss", ":split<CR>C-w>w")
keymap.set("n", "sv", ":vsplit<CR><C-w>w")
keymap.set("n", "sx", ":close<CR>")
keymap.set("n", "sw", ":wincmd w<CR>")
keymap.set("n", "sl", ":wincmd l<CR>")
keymap.set("n", "sh", ":wincmd h<CR>")
keymap.set("n", "sj", ":wincmd j<CR>")
keymap.set("n", "sk", ":wincmd k<CR>")

-- System - tab navigation
keymap.set("n", "<leader>te", ":tabedit ")
keymap.set("n", "<leader>to", ":tabnew ")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
keymap.set("n", "<leader>ev", ":tabnew $MYVIMRC<CR>")
keymap.set("n", "<leader>ea", ":tabnew $HOME/.bashrc<CR>")
keymap.set("n", "<leader>cr", ":tabnew $HOME/.aws/credentials<CR>")
keymap.set("n", "<leader>cf", ":tabnew $HOME/.aws/config<CR>")

----------------------------------------------------------------------------------------------------
-- Pomodoro
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ts", "TimerShow<CR>")
vim.keymap.set("n", "<leader>th", "TimerHide<CR>")

----------------------------------------------------------------------------------------------------
-- Spectre
----------------------------------------------------------------------------------------------------
-- [ Search and replace ]
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)
vim.keymap.set(
	"v",
	"<leader>sw",
	'<esc><cmd>lua require("spectre").open_visual()<CR>',
	{ desc = "Search current word" }
)
vim.keymap.set(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search on current file" }
)

----------------------------------------------------------------------------------------------------
-- Ranger
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>rr", ":Ranger<CR>")

----------------------------------------------------------------------------------------------------
-- Snippet
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>sg", ":Snippets<CR>") -- sg = Suggest

----------------------------------------------------------------------------------------------------
-- Rest
----------------------------------------------------------------------------------------------------
keymap.set("n", ",xr", ":call VrcQuery()<CR>")

----------------------------------------------------------------------------------------------------
-- Markdown
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>md", ":MarkdownPreview<CR>")

----------------------------------------------------------------------------------------------------
-- Kubernetes
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>kk", '<cmd>lua require("kubectl").toggle()<CR>')

----------------------------------------------------------------------------------------------------
-- Packer
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>ii", ":PackerInstall<CR>")
keymap.set("n", "<leader>is", ":PackerSync<CR>")

----------------------------------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>ft", ":FloatermNew<CR>")
keymap.set("n", "<leader>tt", ":terminal<CR>")

----------------------------------------------------------------------------------------------------
-- Hop ( movement )
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader><leader>g", ":HopAnywhere<CR>")
keymap.set("n", "<leader><leader>h", ":HopWord<CR>")
keymap.set("n", "<leader><leader>l", ":HopLine<CR>")
keymap.set("n", "<leader><leader>c", ":HopChar1<CR>")
keymap.set("n", "<leader>b", ",,")

----------------------------------------------------------------------------------------------------
-- Lazygit
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>ll", ":Lazy<CR>")
keymap.set("n", "<leader>lg", ":LazyGit<CR>")

----------------------------------------------------------------------------------------------------
-- Mason ( LSP )
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>mm", ":Mason<CR>")
keymap.set("n", "<leader>mi", ":MasonInstall ")

----------------------------------------------------------------------------------------------------
-- Fugitive git
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>gs", ":G status<CR>")
keymap.set("n", "<leader>ga", ":G add ")
keymap.set("n", "<leader>gA", ":G add .<CR>")
keymap.set("n", "<leader>gc", ":G commit<CR>")
keymap.set("n", "<leader>Gc", ":G add .<CR>:G commit<CR>")
keymap.set("n", "<leader>gC", ":G checkout ")
keymap.set("n", "<leader>gb", ":G branch<CR>")
keymap.set("n", "<leader>gB", ":G branch ")
keymap.set("n", "<leader>gm", ":G merge ")
keymap.set("n", "<leader>gp", ":G pull<CR>")
keymap.set("n", "<leader>gP", ":G push<CR>")
keymap.set("n", "<leader>gl", ":G log<CR>")

----------------------------------------------------------------------------------------------------
-- Neogit
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>ng", ":Neogit<CR>")

----------------------------------------------------------------------------------------------------
-- Git fugitive
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>gb", ":Git blame<CR>")

----------------------------------------------------------------------------------------------------
-- Nvim tree
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")
keymap.set("n", "<leader>nc", ":NvimTreeFocus<CR>")
-- keymap.set('n','<leader>nt',':NERDTreeToggle<CR>')
keymap.set("n", "<leader>db", ":Dashboard<CR>")

----------------------------------------------------------------------------------------------------
-- Telescope
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>tl", ":set nopaste<CR>:Telescope<CR>")
keymap.set("n", "<leader><leader>1", ":set nopaste<CR><Cmd>Telescope find_files hidden=true no_ignore=true<CR>")
keymap.set("n", "<leader><leader>2", ":set nopaste<CR><Cmd>Telescope live_grep hidden=true no_ignore=true<CR>")
keymap.set("n", "<leader><leader>3", ":set nopaste<CR><Cmd>Telescope buffers hidden=true no_ignore=true<CR>")
keymap.set("n", "<leader><leader>4", ":set nopaste<CR><Cmd>Telescope oldfiles hidden=true no_ignore=true<CR>")
keymap.set("n", "<leader><leader>5", ":Telescope projects<CR>")
keymap.set("n", "<leader><leader>6", ":Telescope telescope-tabs list_tabs<CR>")

----------------------------------------------------------------------------------------------------
-- LSP
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "ca", ":Lspsaga code_action<CR>")
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>fc", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format Code" })
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


----------------------------------------------------------------------------------------------------
-- Format
----------------------------------------------------------------------------------------------------
keymap.set("n", "<leader>fm", ":Format<CR>")

----------------------------------------------------------------------------------------------------
-- DAP
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<leader>sv", function() require("dap").step_over() end)
vim.keymap.set("n", "<leader>si", function() require("dap").step_into() end)
vim.keymap.set("n", "<leader>so", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint() end)
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end)
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end)
