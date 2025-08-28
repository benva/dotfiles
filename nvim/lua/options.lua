-- Make line numbers default
vim.o.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 999

-- Raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Set the shell to zsh interactive mode
vim.o.shell = 'zsh -i'

-- Only display filename in tabline
vim.o.tabline = '%!v:lua.DisplayFilenameInTabline()'

function _G.DisplayFilenameInTabline()
  local s = ''
  for i = 1, vim.fn.tabpagenr '$' do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local name = vim.fn.bufname(bufnr)
    local fname = vim.fn.fnamemodify(name, ':t')

    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#' .. ' ' .. fname .. ' '
    else
      s = s .. '%#TabLine#' .. ' ' .. fname .. ' '
    end
  end
  s = s .. '%#TabLineFill#'
  return s
end
