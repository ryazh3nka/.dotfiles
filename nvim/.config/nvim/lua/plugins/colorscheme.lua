return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	config = function()
	vim.g.nord_bold = false
	vim.cmd.colorscheme("nord")  -- Set colorscheme when plugin loads
	end
}
