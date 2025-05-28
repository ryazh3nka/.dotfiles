return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		-- Optional: Set gruvbox options here
		require("gruvbox").setup {
			-- Add your options here
			contrast = "hard", -- or "soft", "medium"
		}

		-- Load the colorscheme
		vim.cmd.colorscheme("gruvbox")
	end,
}

