vim.opt.completeopt = { 'menu', 'menuone', 'preview'}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
    mapping = {
        --["<Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() then
        --        cmp.select_next_item()
        --    elseif luasnip.expand_or_jumpable() then
        --        luasnip.expand_or_jump()
        --    elseif has_words_before() then
        --        cmp.complete()
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),

        --["<S-Tab>"] = cmp.mapping(function(fallback)
        --    if cmp.visible() then
        --        cmp.select_prev_item()
        --    elseif luasnip.jumpable(-1) then
        --        luasnip.jump(-1)
        --    else
        --        fallback()
        --    end
        --end, { "i", "s" }),

        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- TODO make this bring up the documentation instead of completing
        ['<C-k>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    sources = {
        --{ name = 'recursive_garden_search' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        --{ name = 'path' },
        { name = 'luasnip' },
        --{ name = 'buffer', keyword_length = 5 },
        { name = 'emoji', insert = true},
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]',
                --recursive_garden_search = '[🌻]',
            }
        })
    },
    sorting = {

        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,

            -- Can just use an inline function here
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find "^_+"
                local _, entry2_under = entry2.completion_item.label:find "^_+"
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                    return false
                elseif entry1_under < entry2_under then
                    return true
                end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    view = {
        entries = "custom",
        --entries = "wildmenu",
        --entries = "native",

    },

})

local lsp_installer = require('nvim-lsp-installer')

vim.diagnostic.config({
    underline = false,
    virtual_text = false,
})

--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities())

    local opts = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })

            --client.resolved_capabilities.document_formatting = false
            --client.resolved_capabilities.document_range_formatting = false
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }


    --if server.name == "tsserver" then
    --
    --end

    if server.name == "sumneko_lua" then
        opts = vim.tbl_deep_extend("force", {
            settings = {
                Lua = {
                    runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                    diagnostics = {globals = {'vim'}},
                    workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
                    telemetry = {enable = false}
                }
            }

        }, opts)
    end

    --if server.name == 'pylsp' then
    --    settings = {
    --    }
    --end

    server:setup(opts)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    opts = opts or {['lnum'] = line_nr}

    local line_diagnostics = vim.diagnostic.get(bufnr, opts)
    if vim.tbl_isempty(line_diagnostics) then
        return
    end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s ", i, diagnostic.message or "")
        --print(diagnostic_message)
        --if i ~= #line_diagnostics then
        --    diagnostic_message = diagnostic_message .. "\n"
        --end
    end
    vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
