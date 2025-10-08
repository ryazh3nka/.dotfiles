vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.autoindent = false
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.autochdir = true
vim.opt.wrap = false
vim.opt.timeoutlen = 200
vim.g.mapleader = " "

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.opt.showmode = false

-- neovide settings
vim.g.neovide_floating_shadow = false

require("plugins")
require("autocmds")
require("binds")
