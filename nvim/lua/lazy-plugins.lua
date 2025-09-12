require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim', opts = {} },

  -- Automatically pairs brackets, quotes, etc.
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },

  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Colorscheme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {}
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  -- UI enhancement (command line and popup menu)
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  -- Autocompletion
  require 'plugins.blink-cmp',

  -- Autoformat
  require 'plugins.conform',

  -- Navigate with search labels
  require 'plugins.flash',

  -- Add git signs to the gutter, as well as utilities for managing changes
  require 'plugins.gitsigns',

  -- LSP
  require 'plugins.lspconfig',

  -- Quality of life plugins (around/inside textobjects, surround textobjects
  -- with brackets, quotes, etc., plus the tabline and statusline)
  require 'plugins.mini',

  -- Quality of life plugins (Fuzzy finder for files & LSP, LazyGit integration etc.)
  require 'plugins.snacks',

  -- Improved highlighting, editing, and navigating code
  require 'plugins.treesitter',

  -- Display pending keymappings
  require 'plugins.which-key',

  -- LLM autocompletion
  require 'plugins.windsurf',
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
