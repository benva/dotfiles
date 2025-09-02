return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      local function filename_with_modified()
        local filename = vim.fn.expand '%:t'
        if filename == '' then filename = '[No Name]' end

        local modified_marker = ''
        if vim.bo.modified then modified_marker = ' [+]' end

        return filename .. modified_marker
      end

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
        return statusline.section_filename {
          { hl = 'MiniStatuslineFilenameInactive', strings = { filename_with_modified() } },
        }
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_filename = function()
        return filename_with_modified()
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
