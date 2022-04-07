--https://microsoft.github.io/language-server-protocol/specifications/specification-current

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


--
--  local source = {}
--
--  ---Return this source is available in current context or not. (Optional)
--  ---@return boolean
--  function source:is_available()
--    return true
--  end
--
--  ---Return the debug name of this source. (Optional)
--  ---@return string
--  function source:get_debug_name()
--    return 'debug name'
--  end
--
--  ---Return keyword pattern for triggering completion. (Optional)
--  ---If this is ommited, nvim-cmp will use default keyword pattern. See |cmp-config.completion.keyword_pattern|
--  ---@return string
--  function source:get_keyword_pattern()
--    return [[\k\+]]
--  end
--
--  ---Return trigger characters for triggering completion. (Optional)
--  function source:get_trigger_characters()
--    return { '.' }
--  end
--
--  ---Invoke completion. (Required)
--  ---@param params cmp.SourceCompletionApiParams
--  ---@param callback fun(response: lsp.CompletionResponse|nil)
--  function source:complete(params, callback)
--    callback({
--      { label = 'January' },
--      { label = 'February' },
--      { label = 'March' },
--      { label = 'April' },
--      { label = 'May' },
--      { label = 'June' },
--      { label = 'July' },
--      { label = 'August' },
--      { label = 'September' },
--      { label = 'October' },
--      { label = 'November' },
--      { label = 'December' },
--    })
--  end
--
--  ---Resolve completion item. (Optional)
--  ---@param completion_item lsp.CompletionItem
--  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
--  function source:resolve(completion_item, callback)
--    callback(completion_item)
--  end
--
--  ---Execute command after item was accepted.
--  ---@param completion_item lsp.CompletionItem
--  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
--  function source:execute(completion_item, callback)
--    callback(completion_item)
--  end
--
--  ---Register custom source to nvim-cmp.
--  require('cmp').register_source('month', source.new())
