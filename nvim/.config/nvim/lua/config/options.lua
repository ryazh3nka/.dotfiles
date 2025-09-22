-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.smarttab = true
vim.opt.autoindent = false
vim.opt.autochdir = true
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.g.autoformat = false

vim.opt.shortmess:remove("I") -- displays default greeter

-- neovide settings
vim.g.neovide_floating_shadow = false
