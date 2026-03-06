return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      local function filename_with_modified(show_relative_path)
        local filename = vim.fn.expand(show_relative_path and '%:.' or '%:t')

        if filename == '' then
          filename = '[No Name]'
        end

        local modified_marker = vim.bo.modified and ' [+]' or ''

        return filename .. modified_marker
      end

      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
            local filename = filename_with_modified(true)
            local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
            local location = statusline.section_location { trunc_width = 75 }

            return statusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            }
          end,

          inactive = function()
            local filename = filename_with_modified(false)
            local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
            local location = statusline.section_location { trunc_width = 75 }

            return statusline.combine_groups {
              { hl = 'MiniStatuslineInactive', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineInactive', strings = { fileinfo, location } },
            }
          end,
        },
      }
    end,
  },
}
