local Job = require('plenary.job')

local source = {}

source.new = function()
    local self = setmetatable({
        cache = {}
    }, { __index = source })

    return self
end

-- Eventually could also use this logic for a telescope plugin too, both for titles, tags, and body text
source.complete = function(self, _, callback)
    local bufnr = vim.api.nvim_get_current_buf()
    if not self.cache[bufnr] then
        Job:new({
            "card", "search", "-f", "json",
            on_exit = function(job)
                local result = job:result()
                local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))

                if not ok then
                    vim.notify "Failed to parse recursive garden output"
                    return
                end

                local items = {}
                for _, rg_item in ipairs(parsed) do

                    rg_item.body = string.gsub(rg_item.body or "", "\r", "")

                    table.insert(items, {
                        label = string.format("%s", rg_item.title),
                        documentation = {

                        },
                    })
                end

                callback({
                    items = items,
                    isIncomplete = false
                })
                self.cache[bufnr] = items
            end
        })
    else
        callback({
            items = self.cache[bufnr],
            isIncomplete = false
        })
    end
end

source.get_trigger_characters = function()
    return { "[[" }
end

source.is_available = function()
    return vim.bo.filetype == "markdown"
end

require('cmp').register_source('recursive_garden_search', source.new())
