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
vim.g.mapleader = " "

vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.shortmess:append("I")

-- neovide settings
vim.g.neovide_floating_shadow = false

require("plugins")
require("autocmds")
require("binds")

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ebdbb2", bg = "#282828" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#ebdbb2", bg = "#282828" })
