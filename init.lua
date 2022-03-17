vim.cmd('filetype plugin indent off')

require('factorial.plugins')
require('factorial.keybindings')
require('factorial.settings')
require('factorial.nvim-tree-config')
require('factorial.lualine-config')
require('factorial.bufferline-config')
require('factorial.treesitter-config')
require('factorial.telescope-config')
require('factorial.lsp-config')
require('factorial.globals')

vim.cmd('colorscheme dracula')
