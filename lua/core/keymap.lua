local opts = { noremap = true, silent = true }

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

-- System
vim.keymap.set("n", ",ch", ":checkhealth ")
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<C-a>", "gg<M-v>G")
vim.keymap.set("n", "ZQ", ":q!<CR>")
vim.keymap.set("n", "ZZ", ":wq!<CR>")
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
vim.keymap.set("n", "<leader>q", ":Ranger<CR>")

----------------------------------------------------------------------------------------------------
-- Rest
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>rr", ":Rest run<CR>")
vim.keymap.set("n", "<leader>rc", "<C-w>h<C-w>c", { desc = "Close left window" })

----------------------------------------------------------------------------------------------------
-- Snippet
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>sg", ":Snippets<CR>") -- sg = Suggest

----------------------------------------------------------------------------------------------------
-- Rest
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", ",xr", ":call VrcQuery()<CR>")

----------------------------------------------------------------------------------------------------
-- Markdown
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>")

----------------------------------------------------------------------------------------------------
-- Kubernetes
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>kk", '<cmd>lua require("kubectl").toggle()<CR>')

----------------------------------------------------------------------------------------------------
-- Packer
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ii", ":PackerInstall<CR>")
vim.keymap.set("n", "<leader>is", ":PackerSync<CR>")

----------------------------------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ft", ":FloatermNew<CR>")
vim.keymap.set("n", "<leader>tt", ":terminal<CR>")

----------------------------------------------------------------------------------------------------
-- Hop ( movement )
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader><leader>g", ":HopAnywhere<CR>")
vim.keymap.set("n", "<leader>j", ":HopWord<CR>")
vim.keymap.set("n", "<leader><leader>l", ":HopLine<CR>")
vim.keymap.set("n", "<leader><leader>c", ":HopChar1<CR>")
vim.keymap.set("n", "<leader>b", ",,")

----------------------------------------------------------------------------------------------------
-- Lazygit
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>")
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")

----------------------------------------------------------------------------------------------------
-- Mason ( LSP )
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>mm", ":Mason<CR>")
vim.keymap.set("n", "<leader>mi", ":MasonInstall ")

----------------------------------------------------------------------------------------------------
-- Fugitive git
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>gs", ":G status<CR>")
vim.keymap.set("n", "<leader>ga", ":G add ")
vim.keymap.set("n", "<leader>gA", ":G add .<CR>")
vim.keymap.set("n", "<leader>gc", ":G commit<CR>")
vim.keymap.set("n", "<leader>Gc", ":G add .<CR>:G commit<CR>")
vim.keymap.set("n", "<leader>gC", ":G checkout ")
vim.keymap.set("n", "<leader>gb", ":G branch<CR>")
vim.keymap.set("n", "<leader>gB", ":G branch ")
vim.keymap.set("n", "<leader>gm", ":G merge ")
vim.keymap.set("n", "<leader>gp", ":G pull<CR>")
vim.keymap.set("n", "<leader>gP", ":G push<CR>")
vim.keymap.set("n", "<leader>gl", ":G log<CR>")

----------------------------------------------------------------------------------------------------
-- Neogit
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ng", ":Neogit<CR>")

----------------------------------------------------------------------------------------------------
-- Git fugitive
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")

----------------------------------------------------------------------------------------------------
-- Nvim tree
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>nc", ":NvimTreeFocus<CR>")
-- vim.keymap.set('n','<leader>nt',':NERDTreeToggle<CR>')
vim.keymap.set("n", "<leader>db", ":Dashboard<CR>")

----------------------------------------------------------------------------------------------------
-- Telescope
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>tl", ":set nopaste<CR>:Telescope<CR>")
vim.keymap.set("n", "<leader>1", ":set nopaste<CR><Cmd>Telescope find_files hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>2", ":set nopaste<CR><Cmd>Telescope live_grep hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>3", ":set nopaste<CR><Cmd>Telescope buffers hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>4", ":set nopaste<CR><Cmd>Telescope oldfiles hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>5", ":Telescope projects<CR>")
vim.keymap.set("n", "<leader>cs", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<leader>7", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>8", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>9", ":Telescope git_status<CR>")

----------------------------------------------------------------------------------------------------
-- Linter
----------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>lt", function() require("lint").try_lint() end, { desc = "Run Linter" })

----------------------------------------------------------------------------------------------------
-- LSP
----------------------------------------------------------------------------------------------------
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "ca", ":Lspsaga code_action<CR>")
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>")
vim.keymap.set("n", "<leader>pd", ":Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<leader>ol", ":Lspsaga outline<CR>")
vim.keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>")
vim.keymap.set("n", "<leader>wt", ":Lspsaga winbar_toggle<CR>")
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
vim.keymap.set("n", "<leader>fm", ":Format<CR>")

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
vim.keymap.set("n", "<leader>fm", ":Format<CR>")

----------------------------------------------------------------------------------------------------
-- BarBar
----------------------------------------------------------------------------------------------------
-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>")

-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<A-H", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A-L", "<Cmd>BufferMoveNext<CR>")

-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>")
vim.keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>")

-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>")
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
