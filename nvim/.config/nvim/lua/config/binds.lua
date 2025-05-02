-- all keybinds related settings end up here
-- you can think of it as having a nnoremap section in your .vimrc

-- track the diagnostic float window ID
local diagnostic_float_win = nil

-- function to toggle diagnostic float
-- useful when lsp shows errors and you want to see the details
local function toggle_diagnostic_float()
	if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
		vim.api.nvim_win_close(diagnostic_float_win, true)
		diagnostic_float_win = nil
	else
		vim.diagnostic.open_float(nil, {
			scope = "cursor",
			border = "rounded",
			focusable = false,
		})
		local wins = vim.api.nvim_tabpage_list_wins(0)
		for _, win in ipairs(wins) do
			local config = vim.api.nvim_win_get_config(win)
			if config.relative ~= "" then
				diagnostic_float_win = win
				break
			end
		end
	end
end

-- keymap for ctrl-/
vim.keymap.set('n', '<C-/>', toggle_diagnostic_float, { desc = "Toggle diagnostics float" })

-- map q: to q:
vim.api.nvim_set_keymap('n', 'q:', ':q<CR>', { noremap = true, silent = true })

-- map omnicompletion to ctrl-z
vim.keymap.set('i', '<C-z>', '<C-x><C-o>', { noremap = true, desc = 'Trigger omnicompletion' })
