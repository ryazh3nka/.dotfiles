-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quality of life bindings for terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Escape terminal mode" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, desc = "Window commands from terminal" })
