vim.keymap.set("i", "<A-w>", "<C-o>w")
vim.keymap.set("i", "<A-f>", "<C-o>w")
vim.keymap.set("i", "<A-b>", "<C-o>b")
vim.keymap.set("i", "<C-a>", "<C-o>_")
vim.keymap.set("i", "<C-e>", "<C-o>$")

vim.keymap.set("n", "<leader>u", "<CMD>update<CR><CMD>source<CR>", { desc = "source and update" })
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { desc = "write changes" })
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "kill focused window" })
vim.keymap.set("n", "<leader>ww", "<CMD>set wrap!<CR>", { desc = "toggle line wrapping" })
vim.keymap.set("n", "<leader>m", "<CMD>make -B<CR>", { desc = "build a project with make" })
vim.keymap.set("n", "<leader>i", "<CMD>split<CR>", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>o", "<CMD>vsplit<CR>", { desc = "split window horizontally" })

-- quickfix binds
vim.keymap.set('n', '<A-l>', function()
        for _,w in ipairs(vim.fn.getwininfo()) do 
                if w.quickfix == 1 then 
                        return vim.cmd('cclose') 
                end
        end vim.cmd('copen')
end, { desc = 'Toggle quickfix list' })
vim.keymap.set("n", "<A-j>", "<CMD>cnext<CR>", { desc = "next item in quickfix list" })
vim.keymap.set("n", "<A-k>", "<CMD>cprev<CR>", { desc = "previous item in quickfix list" })

-- terminal-related binds
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>t", "<CMD>botright split | resize 10 | terminal<CR>", { desc = "open terminal in the current directory" })
vim.keymap.set("n", "<leader>T", function()
        local git_dir = vim.fn.finddir(".git", ".;")
        local root = git_dir ~= "" and vim.fn.fnamemodify(git_dir, ":h") or vim.fn.getcwd()

        vim.cmd("botright split | resize 10 | terminal")
        vim.fn.chansend(vim.b.terminal_job_id, "cd " .. root .. " && clear\n")
end, { desc = "open terminal in the root directory" })


vim.keymap.set("n", "<leader><leader>", "<CMD>buffer#<CR>", { desc = "switch to previous buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete!<CR>", { desc = "kill focused buffer", nowait = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open Oil in cwd" })

-- fzf binds
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

vim.keymap.set('n', '<leader>n', "<CMD>Noice<CR>", { desc = "open notification history" })
