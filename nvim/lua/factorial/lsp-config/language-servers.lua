local lsp_installer = require('nvim-lsp-installer')

vim.diagnostic.config({underline = false})

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

--local null_ls = require('null-ls')
--null_ls.setup({
--    sources = {
--        null_ls.builtins.diagnostics.eslint_d,
--    },
--})
