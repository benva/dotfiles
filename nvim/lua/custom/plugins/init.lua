-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Automatically close HTML tags
  {
    'windwp/nvim-ts-autotag',
    event = 'BufReadPre',
    opts = {},
  },

  -- AI code completion
  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    config = function() end,
  },
}
