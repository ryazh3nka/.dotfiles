return {
        "folke/noice.nvim",
        opts = {
                lsp = {
                        signature = {
                                enabled = true,
                                auto_open = {
                                        enabled = false,
                                },
                                view = "hover",
                        },
                },
        },
        keys = {
                {
                        "<C-b>",
                        function()
                                local noice = require("noice")
                                if noice.api.status.route.has({ view = "hover" }) then
                                        noice.api.cmd("dismiss")
                                else
                                        require("noice.lsp").signature()
                                end
                        end,
                        mode = "i",
                        desc = "Toggle function signature help (non-focus)",
                },
        },
}
