require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim', opts = {} },

  -- Automatically pairs brackets
  require 'plugins.autopairs',

  -- Autocompletion
  require 'plugins.blink-cmp',

  -- Delete all the buffers except current
  require 'plugins.bufonly',

  -- Autoformat
  require 'plugins.conform',

  -- Navigate with search labels
  require 'plugins.flash',

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'plugins.gitsigns',

  -- Colorscheme
  require 'plugins.gruvbox',

  -- Add indentation guides even on blank lines
  require 'plugins.indent_line',

  -- LazyGit integration
  require 'plugins.lazygit',

  -- LSP Plugins
  require 'plugins.lspconfig',

  -- Collection of various small independent plugins such as around/inside
  -- textobjects, surround textobjects with brackets, quotes, etc., plus the
  -- tabline and statusline
  require 'plugins.mini',

  -- UI enhancement (command line and popup menu)
  require 'plugins.noice',

  -- Quality of life plugins (Fuzzy finder for files, LSP, etc.)
  require 'plugins.snacks',

  -- Highlight todo, notes, etc in comments
  require 'plugins.todo-comments',

  -- Improved highlighting, editing, and navigating code
  require 'plugins.treesitter',

  -- Display pending keymappings
  require 'plugins.which-key',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
