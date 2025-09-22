return {
        {
                "neovim/nvim-lspconfig",
                opts = {
                        servers = { 
                                lua_ls = false,
                                stylua = false,
                        },
                        setup = { lua_ls = function() return true end },
                        document_highlight = { enabled = false },
                        inlay_hints = { enabled = false }
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
                "mason-org/mason-lspconfig.nvim",
                opts = {
                        ensure_installed = { "clangd", "pyright" },
                },
        },
}
