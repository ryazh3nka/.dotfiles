vim.pack.add({
        { src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
        { src = "https://github.com/stevearc/oil.nvim.git" },
        { src = "https://github.com/ibhagwan/fzf-lua.git" },
        { src = "https://github.com/ggandor/leap.nvim.git" },
        { src = "https://github.com/folke/which-key.nvim.git" },
        { src = "https://github.com/NMAC427/guess-indent.nvim.git" },
})

require("oil").setup()
require("which-key").setup({
        delay = 750,
})
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
require("leap").opts.safe_labels = {}
require("guess-indent").setup()

vim.cmd("colorscheme gruvbox")
