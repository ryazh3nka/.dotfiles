return {
        "folke/snacks.nvim",
        opts = {
                indent = { enabled = true },
                words = { enabled = false },
                dashboard = { enabled = false },
        },
        keys = {
                {
                        "<leader>fh",
                        function()
                                require("snacks.picker").files({ cwd = vim.fn.expand("~") })
                        end,
                        desc = "Find File in Home",
                },
        },
}
