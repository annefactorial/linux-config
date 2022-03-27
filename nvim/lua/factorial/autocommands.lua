local group = vim.api.nvim_create_augroup("Factorial Autocmds", { clear = true })


vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    callback = function()
        vim.schedule(function()
            if vim.bo.filetype == '' then
                vim.bo.filetype = 'markdown'
            end
        end)
    end,
    group = group,
})

vim.cmd[[
au FocusLost,BufLeave * :wa
]]
