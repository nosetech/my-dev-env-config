-- ============================================================================
-- basic operation
-- ============================================================================
-- window split
vim.keymap.set("n", "<C-w>p", "<C-w>v")
vim.keymap.set("n", "<C-w>P", "<C-w>s")

-- window move
vim.keymap.set("n", "<C-w>h", "<C-w>h")
vim.keymap.set("n", "<C-w>j", "<C-w>j")
vim.keymap.set("n", "<C-w>k", "<C-w>k")
vim.keymap.set("n", "<C-w>l", "<C-w>l")

-- window resize
vim.keymap.set("n", "<C-w>H", "5<C-w><")
vim.keymap.set("n", "<C-w>J", "5<C-w>-")
vim.keymap.set("n", "<C-w>K", "5<C-w>+")
vim.keymap.set("n", "<C-w>L", "5<C-w>>")

-- linenumber
vim.keymap.set("n", "<C-n>", "<cmd>set relativenumber!<cr>")

-- ============================================================================
-- plugin operation
-- ============================================================================
-- Telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "rg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<C-f>", "<cmd>Telescope frecency<cr>")

-- bufferline
vim.keymap.set("n", "<Tab>","<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-Tab>","<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<C-t>l","<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n", "<C-t>h","<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "<C-t>wl","<cmd>BufferLineCloseRight<cr>")
vim.keymap.set("n", "<C-t>wh","<cmd>BufferLineCloseLeft<cr>")
vim.keymap.set("n", "<C-t>ww","<cmd>BufferLinePickClose<cr>")

-- Fern
vim.keymap.set("n", "<C-e>","<cmd>Fern . -reveal=% -drawer -toggle<cr>")

-- gitgutter
vim.keymap.set("n", "g[","<cmd>GitGutterPrevHunk<cr>")
vim.keymap.set("n", "g]","<cmd>GitGutterNextHunk<cr>")
vim.keymap.set("n", "gh","<cmd>GitGutterLineHighlightsToggle<cr>")
vim.keymap.set("n", "gp","<cmd>GitGutterPreviewHunk<cr>")

-- Coc
vim.keymap.set("n", "cn","<cmd>CocList diagnostics<cr>")
vim.keymap.set("n", "cf","<Plug>(coc-codeaction-selected)iw")
vim.keymap.set("n", "cd","<Plug>(coc-definition)")
vim.keymap.set("n", "cr","<Plug>(coc-references)")
vim.keymap.set("n", "c[","<Plug>(coc-diagnostic-prev)")
vim.keymap.set("n", "c]","<Plug>(coc-diagnostic-next)")
vim.keymap.set("n", "cp","<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>")
vim.api.nvim_create_user_command('Format', 'call CocAction(\'format\')', {nargs=0})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.py" },
	command = 'Format',
})

-- todo-comments
vim.keymap.set("n", "t]", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "t[", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "tn","<cmd>TodoTelescope<cr>")
