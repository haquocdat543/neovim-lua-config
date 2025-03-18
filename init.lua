_G.vim = vim
vim.g.mapleader = " " -- for normal mode

require("core.keymap")
require("core.format")
require("core.option")
require("core.function")

require("plugin.plugin") -- Main lazy.nvim setup

require("core.vim")
require("core.colorscheme")
