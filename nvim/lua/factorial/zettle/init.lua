local Job = require "plenary.job"

local M = {}

local NOTES_DIR = vim.env.HOME .. "/notes/"


M.setup = function()
end

local function get_uuid()
    local job = Job:new({command = "uuidgen"})
    job:sync()
    return job:result()[1]
end

local function get_timestamp()
    local job = Job:new({
        command = 'date',
        args = {
            '+%Y-%m-%dT%H:%M:%S%:z',
        }
    })
    job:sync()
    return job:result()[1]
end


M.create = function(opts)
    opts = vim.tbl_deep_extend("force", {
        splitmode = 'inplace',
    }, opts or {})

    local uuid = '2cd9818d-6cab-4b08-b9c6-0fd6261997dc'
    local timestamp = get_timestamp()
    --local uuid = get_uuid()
    local full_path = NOTES_DIR .. uuid .. '.md'

    if opts.splitmode == 'inplace' then
        vim.cmd('e ' .. full_path)
    elseif opts.splitmode == 'vertical' then
        vim.cmd('vsplit ' .. full_path)
    elseif opts.splitmode == 'horizontal' then
        vim.cmd('split ' .. full_path)
    end

    vim.api.nvim_buf_set_lines(0, 0, 0, true, {
        '---',
        'id: ' .. uuid,
        'timestamp: ' .. timestamp,
        'votes: 1',
        '---',
        '',
    })
    return vim.api.nvim_feedkeys('i', 'n', true)
end


M.setup()
M.create({
    splitmode = 'vertical'
})

return M
