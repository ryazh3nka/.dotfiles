return {
        "saghen/blink.cmp",
        opts = function(_, opts)
                vim.api.nvim_create_autocmd("BufEnter", {
                        callback = function()
                                vim.b.completion = false
                        end,
                })

                Snacks.toggle({
                        name = "Completion",
                        get = function()
                                return vim.b.completion
                        end,
                        set = function(state)
                                vim.b.completion = state
                        end,
                }):map("<leader>uk")

                opts.enabled = function()
                        return vim.b.completion == true
                end

                return opts
        end,
}
