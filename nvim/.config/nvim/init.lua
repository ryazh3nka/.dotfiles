vim.opt.termguicolors = true
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
vim.opt.showmode = false
vim.opt.autochdir = true
vim.g.mapleader = " "

vim.pack.add({
        { src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
        { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
        { src = "https://github.com/stevearc/oil.nvim.git" },
        { src = "https://github.com/ibhagwan/fzf-lua.git" },
        { src = "https://github.com/ggandor/leap.nvim.git" },
})

require("oil").setup({})
require("lualine").setup({})
require("fzf-lua").setup({
        files = { 
                fd_opts = [[--type f --exclude .git --exclude '.*']],
                follow = true,
        },
        keymap = {
                builtin = {
                        ["<C-j>"] = "down",
                        ["<C-k>"] = "up",
                }
        },
        fzf_colors = {
                ["pointer"] = "#b16286",
        },
})
require('leap').opts.safe_labels = {}

vim.keymap.set("i", "<A-w>", "<C-o>w")
vim.keymap.set("i", "<A-f>", "<C-o>w")
vim.keymap.set("i", "<A-b>", "<C-o>b")
vim.keymap.set("i", "<A-e>", "<C-o>e")

vim.keymap.set("n", "<leader>o", "<CMD>update<CR><CMD>source<CR>", { desc = "source and update" })
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { desc = "write changes" })
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "kill focused window" })

vim.keymap.set("n", "<leader>bb", "<CMD>buffer#<CR>", { desc = "switch to previous buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "kill focused buffer" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open Oil in cwd" })

vim.keymap.set("n", "<leader>fh", "<CMD>FzfLua files cwd='~'<CR>", { desc = "files in ~" })
vim.keymap.set("n", "<leader>fc", "<CMD>FzfLua files cwd='~/.config'<CR>", { desc = "files in ~/.config" })
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "files in current directory" })
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "buffer list" })
vim.keymap.set("n", "<leader>fq", "<CMD>FzfLua quickfix<CR>", { desc = "quickfix list" })
vim.keymap.set("n", "<leader>ft", "<CMD>FzfLua tabs<CR>", { desc = "opened tabs" })
vim.keymap.set("n", "<leader>fo", "<CMD>FzfLua oldfiles<CR>", { desc = "recently opened files" })

vim.keymap.set("n", "<leader>fr", function()
        local root = vim.fs.root(0, ".git") or vim.loop.cwd()
        require("fzf-lua").files({
                cwd = root,
                fd_opts = [[--type f --exclude .git --exclude '.*']],
        })
end, { desc = "files from git root" })

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)', { desc = "launch Leap" })
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { desc = "launch Leap per window"})

vim.cmd("colorscheme gruvbox")

-- neovide settings
vim.g.neovide_floating_shadow = false
