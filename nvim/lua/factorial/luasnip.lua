local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config({
    -- Allow resuming snippets
    history = true,

    -- Update dynamic ssnippets as you type
    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,

    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = {
                    { "<-", "Error" }
                },
            }
        }
    }
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set({ "i" }, "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/factorial/snippets.lua<cr>')
