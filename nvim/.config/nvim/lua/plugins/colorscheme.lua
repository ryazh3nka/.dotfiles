return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup {
			contrast = "medium",
		}

		vim.cmd.colorscheme("gruvbox")
	end,
}

