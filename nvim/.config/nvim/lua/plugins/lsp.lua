return {
        {
                "neovim/nvim-lspconfig",
                opts = {
                        servers = {
                                lua_ls = false,
                        },
                        setup = {
                                lua_ls = function() return true end,
                        },
                        document_highlight = {
                                enabled = false,
                        },
                },
        },

        {
                "folke/lazydev.nvim",
                opts = {
                        library = {},
                        lspconfig = false,
                },
        },

        {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                        ensure_installed = { "clangd", "pyright" },
                },
        },
}
