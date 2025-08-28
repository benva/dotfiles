return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      -- Statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_git = function()
        return ''
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_diff = function()
        return ''
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_diagnostics = function()
        return ''
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_lsp = function()
        return ''
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.inactive = function()
        local filename = vim.fn.expand '%:t'
        return statusline.section_filename {
          { hl = 'MiniStatuslineFilenameInactive', strings = { filename } },
        }
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_filename = function()
        return vim.fn.expand '%:t'
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_fileinfo = function()
        return vim.bo.filetype
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
