local diagnostic_float_win = nil

local function toggle_diagnostic_float()
	if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
		vim.api.nvim_win_close(diagnostic_float_win, true)
		diagnostic_float_win = nil
		return
	end

	local opts = {
		scope = "cursor",
		border = "rounded",
		focusable = false,
	}

	vim.diagnostic.open_float(nil, opts)

	vim.defer_fn(function()
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			local config = vim.api.nvim_win_get_config(win)
			if config.relative ~= "" then
				diagnostic_float_win = win
				break
			end
		end
	end, 10)
end

vim.keymap.set('n', '<C-I>', toggle_diagnostic_float, { desc = "Toggle diagnostics float" })
vim.keymap.set('i', '<C-z>', '<C-x><C-o>', { noremap = true, desc = 'Trigger omnicompletion' })
