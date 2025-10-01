vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.autoindent = false
vim.opt.autochdir = true
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.showmode = false
vim.g.mapleader = " "

vim.pack.add({
        { src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
        { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
        { src = "https://github.com/stevearc/oil.nvim.git" },
})

require("oil").setup()
require("lualine").setup()

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.cmd("colorscheme gruvbox")

-- neovide settings
vim.g.neovide_floating_shadow = false
