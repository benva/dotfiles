-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Keep cursor centred vertically
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorMoved' }, {
  group = vim.api.nvim_create_augroup('verically-centre-cursor', { clear = true }),
  pattern = { '*', '*.*' },
  callback = function()
    vim.cmd 'normal! zz'
  end,
})

-- Open the terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('terminal-insert-mode', { clear = true }),
  callback = function()
    vim.cmd 'startinsert'
  end,
})
