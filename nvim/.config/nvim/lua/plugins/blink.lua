return {
        "saghen/blink.cmp",
        opts = function(_, opts)
                vim.g.completion_enabled = false

                Snacks.toggle({
                        name = "Completion",
                        get = function()
                                return vim.g.completion_enabled
                        end,
                        set = function(state)
                                vim.g.completion_enabled = state
                        end,
                }):map("<leader>uk")

                local default_enabled = opts.enabled or function()
                        return true
                end

                opts.enabled = function()
                        if not vim.g.completion_enabled then
                                return false
                        end
                        return default_enabled()
                end

                opts.cmdline = opts.cmdline or {}
                opts.cmdline.enabled = false

                return opts
        end,
}
