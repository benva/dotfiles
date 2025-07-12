return {
  {
    'Exafunction/windsurf.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('codeium').setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          default_filetype_enabled = false,
          filetypes = { python = true, html = true },
          key_bindings = {
            accept = '<C-g>',
            next = '<C-.>',
            prev = '<C-,>',
          },
        },
      }
    end,
  },
}
