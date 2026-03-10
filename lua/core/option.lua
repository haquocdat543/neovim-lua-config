vim.g.mapleader = " "      -- for normal mode
vim.g.maplocalleader = " " -- for local leader mappings
vim.opt.title = true
vim.opt.hlsearch = true
-- vim.opt.shell = "/opt/homebrew/bin/zsh"
vim.opt.history = 200
-- vim.opt.background = "dark"
vim.opt.paste = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.laststatus = 2
vim.opt.cursorline = true

vim.opt.tabstop = 2      -- Visually represent a tab as 2 spaces
vim.opt.shiftwidth = 2   -- Indent by 2 spaces
vim.opt.softtabstop = 2  -- Backspace removes 2 spaces at a time
vim.opt.expandtab = true -- Convert tabs to spaces on insert
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·" }

vim.opt.autoindent = true  -- Maintain indentation level on new lines
vim.opt.smartindent = true -- Auto-indent based on syntax

vim.opt.viminfo = "'100,<1000000,s100000,h"

-- Set option
vim.o.paste = true -- global option

-- Detect OS / environment
local uname = vim.loop.os_uname().sysname

-- Adjust paths based on OS
if uname == "Linux" then
	vim.g.python3_host_prog = "/usr/bin/python3"
	vim.o.clipboard = "unnamedplus" -- xclip/xsel should work
elseif uname == "Darwin" then
	vim.g.python3_host_prog = "/usr/local/bin/python3"
	vim.o.clipboard = "unnamedplus" -- pbcopy/pbpaste
end
