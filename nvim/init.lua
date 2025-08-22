-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Associate .tpl file types with HTML
vim.filetype.add {
  extension = {
    tpl = 'html',
  },
}

-- Associate BUILD files to python
vim.filetype.add {
  filename = {
    ['BUILD'] = 'python',
  },
}
-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Basic Autocommands ]]
require 'autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
