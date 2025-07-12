return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('gruvbox').setup {}

      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
