require("bufferline").setup()
vim.cmd[[
nnoremap <silent><tab> :BufferLineCycleNext<CR>
nnoremap <silent><S-tab> :BufferLineCyclePrev<CR>
]]
