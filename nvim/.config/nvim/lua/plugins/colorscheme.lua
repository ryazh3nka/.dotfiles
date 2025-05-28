return {
	{
		"kdheepak/monochrome.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme monochrome")
			vim.cmd [[
				highlight Normal ctermbg=none guibg=none
				highlight NormalNC ctermbg=none guibg=none
				highlight NormalFloat ctermbg=none guibg=none
				highlight EndOfBuffer ctermbg=none guibg=none
			]]
		end,
	},
}
