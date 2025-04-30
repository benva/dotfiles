-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Keeps the cursor centred in the screen
  { 'arnamak/stay-centered.nvim', lazy = false, opts = {} },

  -- Automatically closes HTML tags
  {
    'windwp/nvim-ts-autotag',
    event = 'BufReadPre',
    opts = {},
  },

  -- Windsurf plugin for AI code completion
  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true })
    end,
  },
}
