return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require('mini.indentscope').setup {
			symbol = '▏',
		}
	end
}
