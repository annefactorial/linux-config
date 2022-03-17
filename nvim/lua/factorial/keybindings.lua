vim.g.mapleader = ','

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end



local function nmap(shortcut, command) map('n', shortcut, command) end
local function imap(shortcut, command) map('i', shortcut, command) end
local function vmap(shortcut, command) map('v', shortcut, command) end
local function cmap(shortcut, command) map('c', shortcut, command) end
local function tmap(shortcut, command) map('t', shortcut, command) end

nmap('<c-c>', '<esc>')
imap('<c-c>', '<esc>')
vmap('<c-c>', '<esc>')


nmap('<leader>nn', ':NvimTreeToggle<CR>')
nmap('<leader>nf', ':NvimTreeFindFile<CR>')

vim.cmd[[
no <leader>d C---<esc>o<esc>!!date +"Timestamp: \%Y-\%m-\%d \%H:\%M:\%S"<cr>o

iab pdb import ipdb; ipdb.set_trace()

inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap {,<cr> {<cr>},<c-o>O<tab>
inoremap {;<cr> {<cr>};<c-o>O<tab>

inoremap ({<cr> ({<cr>})<c-o>O<tab>
inoremap ({,<cr> ({<cr>}),<c-o>O<tab>
inoremap ({;<cr> ({<cr>});<c-o>O<tab>

inoremap {)<cr> {<cr>})<c-o>O<tab>
inoremap {),<cr> {<cr>}),<c-o>O<tab>
inoremap {);<cr> {<cr>});<c-o>O<tab>

inoremap (<cr> (<cr>)<c-o>O<tab>
inoremap (,<cr> (<cr>),<c-o>O<tab>
inoremap (;<cr> (<cr>);<c-o>O<tab>

inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap [,<cr> [<cr>],<c-o>O<tab>
inoremap [;<cr> [<cr>];<c-o>O<tab>

inoremap [{<cr> [{<cr>}]<c-o>O<tab>
inoremap [{,<cr> [{<cr>}],<c-o>O<tab>
inoremap [{;<cr> [{<cr>}];<c-o>O<tab>

inoremap {/*<cr> {/*<cr>*/}<c-o>O<tab>
inoremap :<cr> :<cr><tab>

]]


nmap('Y', 'y$')

nmap('<C-l>', '<C-l>zz')
nmap('t', 'gj')
nmap('n', 'gk')
nmap('s', 'l')
-- keep search matches in the middle of the window
nmap('l', 'nzzzv')
nmap('j', 't')
nmap('k', 's')

nmap('T', '}')
nmap('N', '{')
nmap('L', 'Nzzzv')
nmap('J', 'T')
nmap('K', 'S')
nmap('S', '$')
nmap('H', '^')

vmap('t', 'gj')
vmap('n', 'gk')
vmap('s', 'l')
vmap('l', 'n')
vmap('j', 't')
vmap('k', 's')

vmap('T', '}')
vmap('N', '{')
vmap('L', 'N')
vmap('J', 'T')
vmap('K', 'S')
vmap('S', '$')
vmap('H', '^')

nmap('<leader>h', ':nohl<cr>')

nmap('-', 'J')
vmap('-', 'J')
nmap('Q', 'gqap')


-- Make space the wincmd
nmap('<space>', '<c-w>')

--nmap('<C-w>h', '<C-w>h')
--nmap('<C-w>t', '<C-w>j')
--nmap('<C-w>n', '<C-w>k')
--nmap('<C-w>s', '<C-w>l')
--
--nmap('<space>h', '<C-w>h')
--nmap('<space>t', '<C-w>j')
--nmap('<space>n', '<C-w>k')
--nmap('<space>s', '<C-w>l')
--nmap('<space>v', ':vsplit<cr>')
--nmap('<space>S', ':split<cr>')
--nmap('<space>|', '<C-w>|')
--nmap('<space>=', '<C-w>=')
--nmap('<space>x', '<C-w>x')
--
--nmap('<space><space>', ':w<cr>:lua vim.lsp.buf.formatting()<cr>')
nmap('<leader><space>', '<cmd>w<cr>')
nmap('<leader>x<space>', ':w<cr>:lua vim.lsp.buf.formatting()<cr>:source %<cr>')


nmap('<C-e>', '3<C-e>')
nmap('<C-y>', '3<C-y>')

imap(',', ',<c-g>u')
imap('.', '.<c-g>u')
imap('!', '!<c-g>u')
imap('?', '?<c-g>u')


nmap('<leader>bc', ':bdelete<cr>')
nmap('<leader>f', ':Telescope find_files<cr>')
nmap('<leader>r', ':Telescope live_grep<cr>')
nmap('<leader>li', ':LspInfo<cr>')

nmap('<leader>tn', ':TestNearest<cr>')
nmap('<leader>tf', ':TestFile<cr>')
nmap('<leader>ts', ':TestSuite<cr>')
nmap('<leader>tl', ':TestLast<cr>')
nmap('<leader>tv', ':TestVisit<cr>')

nmap('<C-p>', '<cmd>Telescope find_files<cr>')


vim.cmd[[
let test#strategy = "neovim"
]]

