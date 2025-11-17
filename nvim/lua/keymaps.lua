-- Delete the current buffer
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Yank the relative path of the buffer
vim.keymap.set('n', '<leader>bp', '<cmd>let @*=fnamemodify(expand("%"), ":.")<CR>', { desc = '[B]uffer [P]ath' })

-- Paste copyright string to buffer
vim.keymap.set('n', '<leader>bc', '<cmd>read! cat ~/Kumo-no-Mori/copyright.txt<CR>', { desc = '[B]uffer [C]opyright' })

-- Run test command for current buffer
vim.keymap.set('n', '<leader>bt', '<cmd>vertical terminal pants test %<CR>', { desc = '[B]uffer [T]est' })

-- Write the current buffer without formatting
vim.keymap.set('n', '<C-s>', '<cmd>noa w<CR>', { desc = 'Write the current buffer' })

-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
