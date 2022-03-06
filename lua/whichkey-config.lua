local wk = require("which-key")
wk.setup({
    plugins = {
        spelling = {
            enabled = true,
        }
    }
})
wk.register({
    q = {':q<cr>', "Quit"},
    Q = {':wq<cr>', "Save and Quit"},
    w = {':w<cr>', "Save"},
    x = {':bdelete<cr>', "Close"},
    E = {':e ~/.config/nvim/init.lua<cr>', 'Edit config'},
    f = {':Telescope find_files<cr>', 'Telescope Find Files'},
    r = {':Telescope live_grep<cr>', 'Telescope Live Grep'},
    --v = {
    --    ':lua require("telescope-config").search_vim_config()<cr>', "Search Vim Config"
    --},
    l = {
        name = 'LSP',
        i = {':LspInfo<cr>', 'Connected Language Servers'},
    }
}, {prefix = '<leader>'})

wk.register({
    ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Telescope Find Files"},
})


--let test#strategy = "neovim"
--"let test#python#pytest#options = '--capture=no'
--"let test#python#runner = 'pytest'
--
--
--nmap <silent> <leader>tN :TestNearest<CR>
--nmap <silent> <leader>tF :TestFile<CR>
--nmap <silent> <leader>tS :TestSuite<CR>
--nmap <silent> <leader>tL :TestLast<CR>
--nmap <silent> <leader>tV :TestVisit<CR>
--
--nmap <silent> <leader>tn :TestNearest<CR>
--nmap <silent> <leader>tf :TestFile<CR>
--nmap <silent> <leader>ts :TestSuite<CR>
--nmap <silent> <leader>tl :TestLast<CR>
--nmap <silent> <leader>tv :TestVisit<CR>
--
--nmap <silent> <leader>ws :%s/\s\+$//e<CR>
--
--]]
