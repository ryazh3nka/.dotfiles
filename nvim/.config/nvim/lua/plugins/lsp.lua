return {
        {
                "neovim/nvim-lspconfig",
                opts = {
                        servers = {
                                -- disables lua-ls
                                lua_ls = false,
                        },
                        setup = {
                                lua_ls = function() return true end,
                        },
                },
        },

        {
                "folke/neodev.nvim",
                enabled = false,
        },

        {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                        ensure_installed = {"clangd", "pyright"},
                },
        },
}
