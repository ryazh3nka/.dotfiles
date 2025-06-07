-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "javascript", "typescript", "c", "cpp", "rust", "go", "bash" },

				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = {},
					additional_vim_regex_highlighting = false,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn", -- Start incremental selection
						node_incremental = "grn", -- Increment to the next node
						scope_incremental = "grc", -- Increment to the next scope
						node_decremental = "grm", -- Decrement to the previous node
					},
				}
			})

		end,
	},
}
