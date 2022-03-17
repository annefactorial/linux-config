vim.opt.completeopt = { 'menu', 'menuone', 'preview'}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

require('luasnip').config.set_config({
    -- Allow resuming snippets
    history = true,

    -- Update dynamic ssnippets as you type
    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,
})

---vim.keymap.set({"i", "s"}, '<c-k>', function()
---    if luasnip.expand_or_jumpable() then
---        luasnip.expand_or_jump()
---    end
---end, { silent = true })

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        --{ name = 'buffer', keyword_length = 5 },
        { name = 'emoji' },
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]',

            }

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            --before = function (entry, vim_item)
            --    ...
            --    return vim_item
            --end
        })
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    }
})

--[[
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
        { name = 'buffer' },
    })
})
]]

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--    sources = {
--        { name = 'buffer' }
--    }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--        { name = 'path' }
--    }, {
--        { name = 'cmdline' }
--    })
--})
