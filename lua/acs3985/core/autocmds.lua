local api = vim.api

-- close help, man, qf, lspinfo with 'q'
api.nvim_create_autocmd("FileType", {
	pattern = { "man", "help", "qf", "lspinfo" }, -- "startuptime",
	command = "nnoremap <buffer><silent> q :close<CR>",
})

-- Terminal mappings
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-c>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	-- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = { "term://*" }, -- use term://*toggleterm#* for only ToggleTerm
	command = "lua set_terminal_keymaps()",
})

-- Autolist markdown mappings
function _G.set_markdown_keymaps()
	vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", "o", "o<cmd>AutolistNewBullet<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", "O", "O<cmd>AutolistNewBulletBefore<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "i", "<tab>", "<Esc>><cmd>AutolistRecalculate<cr>a<space>", {})
	vim.api.nvim_buf_set_keymap(0, "i", "<S-tab>", "<Esc><<cmd>AutolistRecalculate<cr>a", {})
	vim.api.nvim_buf_set_keymap(0, "n", "dd", "dd<cmd>AutolistRecalculate<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "v", "d", "d<cmd>AutolistRecalculate<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", ">", "><cmd>AutolistRecalculate<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", "<", "<<cmd>AutolistRecalculate<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", "<cmd>AutolistRecalculate<cr>", {})
	vim.api.nvim_buf_set_keymap(0, "n", "<C-n>", "<cmd>lua HandleCheckbox()<CR>", {})
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.softtabstop = 2
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPre", "BufNewFile" }, {
	pattern = { "*.md" },
	command = "lua set_markdown_keymaps()",
})
