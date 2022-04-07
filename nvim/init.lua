vim.cmd[[
filetype plugin on
filetype indent on
syntax on
]]

require('factorial.globals')
require('factorial.plugins')
require('factorial.keybindings')
require('factorial.settings')
require('factorial.luasnip')
require('factorial.nvim-tree-config')
require('factorial.lualine-config')
require('factorial.treesitter-config')
require('factorial.telescope-config')

require('factorial.completion-config')

require('factorial.autocommands')

--vim.cmd('colorscheme dracula')
vim.cmd('colorscheme gruvbox')


--vim.cmd[[
--
--function! JumpToTitle()
--    call search('---', 'b')
--    if search("^title:", 'z') == 0
--        call append(line('$'), 'title: ')
--        execute "normal! G"
--    endif 
--    call feedkeys('A')
--endfunction
--
--function! JumpToVotes()
--    call search('---', 'b')
--    if search("^votes:", 'z') == 0
--        call append(line('$'), 'votes: 1')
--        execute "normal! G"
--    endif 
--    call feedkeys('$')
--endfunction
--
--function! ZettleSettings()
--    " Jump to the votes line and increment it by count (or 1 if no count)
--    nnoremap <silent><leader>ca :call JumpToVotes()<cr>
--
--    " Jump to the title line or add it if it doesn't exist and enter insert mode
--    nnoremap <silent><leader>ct :call JumpToTitle()<cr>
--
--    setlocal nonumber
--endfunction
--
--
--augroup zettle
--    autocmd!
--    autocmd BufRead,BufNew *.md call ZettleSettings()
--augroup END
--]]
