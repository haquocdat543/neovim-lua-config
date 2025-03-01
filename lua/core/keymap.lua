local keymap = vim.keymap

-- Pomodoro
vim.keymap.set('n', '<leader>ts', 'TimerShow<CR>')
vim.keymap.set('n', '<leader>th', 'TimerHide<CR>')

-- Spectre [ Search and replace ]
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre", })
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word", })
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word", })
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search on current file", })

-- Ranger
keymap.set('n', '<leader>rr', ':Ranger<CR>')

-- Terminal
keymap.set('n', '<leader>tn', ':split<CR><C-w>w:term<CR>i')
keymap.set('n', '<leader>tm', ':split<CR><C-w>w:horizontal resize -10<CR>:term<CR>i')

-- Diff
keymap.set('n', '<leader>dd', ':windo diffthis<CR>')
keymap.set('n', '<leader>do', ':diffoff!<CR>')

-- Snippet
keymap.set('n', '<leader>sg', ':Snippets<CR>') -- sg = Suggest

-- Query { Rest API ]
keymap.set('n', ',xr', ':call VrcQuery()<CR>')

-- Markdown
keymap.set('n', '<leader>md', ':MarkdownPreview<CR>')

-- Kubernetes
-- keymap.set('n', '<leader>kk', '<cmd>lua require("kubectl").toggle()<CR>')

-- System
keymap.set('n', '<leader>pa', '"*p')
keymap.set('n', '<leader>ya', 'gg"*yG\'\'')
keymap.set('n', '<leader>yy', '"*yy')
keymap.set('n', '<leader>el', 'yypC')
keymap.set('n', '<leader>eL', 'yyPC')

-- System
keymap.set('n', ',ch', ':checkhealth ')
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', '<C-a>', 'gg<M-v>G')
keymap.set('n', 'ZQ', ':q!<CR>')
keymap.set('n', 'ZZ', ':wq!<CR>')
keymap.set('n', '<leader>hr', ':%!xxd<CR> :set filetype=xxd<CR>')
keymap.set('n', '<leader>hw', ':%!xxd -r<CR> :set binary<CR> :set filetype=<CR>')
keymap.set('n', '<leader>el', 'yypC')
keymap.set('n', '<leader>eL', 'yyPC')
keymap.set('n', '<leader>ra', ':call ReplaceAll')

-- Map ESC
keymap.set('i', '<C-x>', '<Esc><Esc>')

-- Nvimtree - resize
keymap.set('n', '<leader><leader>v', ':vertical res ')

-- System - commands
keymap.set('n', '<leader>rg', ':registers<CR>')

-- System - default file open
keymap.set('n', '<leader>en', ':tabnew ~/.config/nvim/init.lua<CR>')
keymap.set('n', '<leader>ev', ':tabnew ~/.vimrc<CR>')
keymap.set('n', '<leader>ea', ':tabnew ~/.bashrc<CR>')
keymap.set('n', '<leader>ec', ':tabnew ~/.ssh/config<CR>')
keymap.set('n', '<leader>sc', ':tabnew ~/Suitcase/bash/scripts/BasicCalculator.sh<CR>')
keymap.set('n', '<leader>sn', ':tabnew ~/Suitcase/snippets/sh.snippets<CR>')
keymap.set('n', '<leader>nn', ':set nopaste<CR>')
keymap.set('n', '<leader>nm', ':set paste<CR>')

-- System - navigation
keymap.set('n', 'ss', ':split<CR>C-w>w')
keymap.set('n', 'sv', ':vsplit<CR><C-w>w')
keymap.set('n', 'sx', ':close<CR>')
keymap.set('n', 'sw', ':wincmd w<CR>')
keymap.set('n', 'sl', ':wincmd l<CR>')
keymap.set('n', 'sh', ':wincmd h<CR>')
keymap.set('n', 'sj', ':wincmd j<CR>')
keymap.set('n', 'sk', ':wincmd k<CR>')

-- System - tab navigation
keymap.set('n', '<leader>te', ':tabedit ')
keymap.set('n', '<leader>to', ':tabnew ')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')
keymap.set('n', '<leader>ev', ':tabnew $MYVIMRC<CR>')
keymap.set('n', '<leader>ea', ':tabnew $HOME/.bashrc<CR>')
keymap.set('n', '<leader>cr', ':tabnew $HOME/.aws/credentials<CR>')
keymap.set('n', '<leader>cf', ':tabnew $HOME/.aws/config<CR>')


-- Package manager
keymap.set('n', '<leader>ii', ':PackerInstall<CR>')
keymap.set('n', '<leader>is', ':PackerSync<CR>')

-- Finder
keymap.set('n', '<leader>fi', ':FZF<CR>')
keymap.set('n', '<leader>fg', ':Rg<CR>')
keymap.set('n', '<leader>fb', ':Buffers<CR>')
keymap.set('n', '<leader>ft', ':FloatermNew<CR>')
keymap.set('n', '<leader>tt', ':terminal<CR>')

-- Hop ( movement )
keymap.set('n', '<leader><leader>g', ':HopAnywhere<CR>')
keymap.set('n', '<leader><leader>h', ':HopWord<CR>')
keymap.set('n', '<leader><leader>l', ':HopLine<CR>')
keymap.set('n', '<leader><leader>c', ':HopChar1<CR>')
keymap.set('n', '<leader>b', ',,')

-- Lazygit
keymap.set('n', '<leader>ll', ':Lazy<CR>')
keymap.set('n', '<leader>lg', ':LazyGit<CR>')

-- Mason ( LSP )
keymap.set('n', '<leader>mm', ':Mason<CR>')
keymap.set('n', '<leader>mi', ':MasonInstall ')

-- Fugitive git
keymap.set('n', '<leader>gs', ':G status<CR>')
keymap.set('n', '<leader>ga', ':G add ')
keymap.set('n', '<leader>gA', ':G add .<CR>')
keymap.set('n', '<leader>gc', ':G commit<CR>')
keymap.set('n', '<leader>Gc', ':G add .<CR>:G commit<CR>')
keymap.set('n', '<leader>gC', ':G checkout ')
keymap.set('n', '<leader>gb', ':G branch<CR>')
keymap.set('n', '<leader>gB', ':G branch ')
keymap.set('n', '<leader>gm', ':G merge ')
keymap.set('n', '<leader>gp', ':G pull<CR>')
keymap.set('n', '<leader>gP', ':G push<CR>')
keymap.set('n', '<leader>gl', ':G log<CR>')

-- Neogit
keymap.set('n', '<leader>ng', ':Neogit<CR>')

-- Git blame
keymap.set('n', '<leader>gb', ':Git blame<CR>')
keymap.set('n', '<C-b>b', ':set backup<CR>')
keymap.set('n', '<C-h>h', ':noh<CR>')
keymap.set('n', '<C-q>q', ':q!<CR>')
keymap.set('n', '<C-q>w', ':wq!<CR>')

-- System - replacement & navigation
keymap.set('n', '<C-c>1', ':%s///g<Left><Left><Left>')
keymap.set('n', '<C-c>2', ':.,.s///g<Left><Left><Left>')
keymap.set('n', '<C-c>3', ':.,0s///g<Left><Left><Left>')
keymap.set('n', '<C-c>4', ':.,$s///g<Left><Left><Left>')
keymap.set('n', '<C-c>5', ':.,.-s///g<Left><Left><Left><Left><Left>')
keymap.set('n', '<C-c>6', ':.,.+s///g<Left><Left><Left><Left><Left>')
keymap.set('n', '<C-x>', '<C-p><CR>')
keymap.set('n', '<A-j>', ':m .+1<CR>==')
keymap.set('n', '<A-k>', ':m .-2<CR>==')
keymap.set('n', '<leader>aa', ':UltiSnipsEdit<CR>')
keymap.set('n', '<leader>ww', ':w!<CR>')
keymap.set('n', '<C-s>s', ':<ESC>w!<CR>')
keymap.set('n', '<A-n>n', ':n<CR>')
keymap.set('n', '<A-p>p', ':p<CR>')

-- Navigation
keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>')
keymap.set('n', '<leader>nc', ':NvimTreeFocus<CR>')
-- keymap.set('n','<leader>nt',':NERDTreeToggle<CR>')
keymap.set('n', '<leader>db', ':Dashboard<CR>')

-- Telescope
keymap.set('n', '<leader>tl', ':Telescope<CR>')
keymap.set('n', '<leader><leader>4', ':Telescope projects<CR>')
keymap.set('n', '<leader><leader>5', ':Telescope telescope-tabs list_tabs<CR>')
keymap.set("n", "<leader><leader>1", "<Cmd>Telescope find_files<CR>")
keymap.set("n", "<leader><leader>2", "<Cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader><leader>3", "<Cmd>Telescope oldfiles<CR>")
