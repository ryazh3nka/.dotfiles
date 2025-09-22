-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quality of life bindings for terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Escape terminal mode" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, desc = "Window commands from terminal" })

-- navigation in insert mode
vim.keymap.set("i", "<A-w>", "<C-o>w", { noremap = true })
vim.keymap.set("i", "<A-b>", "<C-o>b", { noremap = true })

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, desc = "Open oil.nvim" })
