vim.g.mapleader = ','

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end



local function nmap(shortcut, command) map('n', shortcut, command) end
local function imap(shortcut, command) map('i', shortcut, command) end
local function vmap(shortcut, command) map('v', shortcut, command) end
local function cmap(shortcut, command) map('c', shortcut, command) end
local function tmap(shortcut, command) map('t', shortcut, command) end

--nmap('<c-c>', '<esc>')
imap('<c-c>', '<esc>')
vmap('<c-c>', '<esc>')

vim.cmd[[
nmap <silent> <leader>ws :%s/\s\+$//e<CR>
]]


-- be able to edit things in the :command line
vim.cmd[[
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <m-f> <c-right>
cnoremap <m-b> <c-left>
cnoremap <c-k> <c-o>C
]]

nmap('<leader>nn', ':NvimTreeToggle<CR>')
nmap('<leader>nf', ':NvimTreeFindFile<CR>')

vim.cmd[[
no <leader>d C---<esc>o<esc>!!date +"Timestamp: \%Y-\%m-\%d \%H:\%M:\%S"<cr>o

iab pdb import ipdb; ipdb.set_trace()

inoremap {<cr> {<cr>}<c-o>O
inoremap {,<cr> {<cr>},<c-o>O
inoremap {;<cr> {<cr>};<c-o>O

inoremap ({<cr> ({<cr>})<c-o>O
inoremap ({,<cr> ({<cr>}),<c-o>O
inoremap ({;<cr> ({<cr>});<c-o>O

inoremap {)<cr> {<cr>})<c-o>O
inoremap {),<cr> {<cr>}),<c-o>O
inoremap {);<cr> {<cr>});<c-o>O

inoremap (<cr> (<cr>)<c-o>O
inoremap (,<cr> (<cr>),<c-o>O
inoremap (;<cr> (<cr>);<c-o>O

"inoremap [<cr> [<cr>]<c-o>O<tab>
"inoremap [,<cr> [<cr>],<c-o>O<tab>
"inoremap [;<cr> [<cr>];<c-o>O<tab>
"
"inoremap [{<cr> [{<cr>}]<c-o>O<tab>
"inoremap [{,<cr> [{<cr>}],<c-o>O<tab>
"inoremap [{;<cr> [{<cr>}];<c-o>O<tab>

inoremap {/*<cr> {/*<cr>*/}<c-o>O<tab>
"inoremap :<cr> :<cr><tab>

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
--nmap('K', 'S')
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

nmap('<leader>h', '<cmd>nohl<cr>')

nmap('-', 'J')
vmap('-', 'J')
nmap('Q', 'gqap')


-- Make space the wincmd
nmap('<space>', '<c-w>')

nmap('<space>t', '<C-w>j')
nmap('<space>T', '<C-w>J')
nmap('<space>n', '<C-w>k')
nmap('<space>N', '<C-w>K')
nmap('<space>s', '<C-w>l')
nmap('<space>S', '<C-w>L')

nmap('<space>j', '<C-w>t')
nmap('<space>J', '<C-w>T')
nmap('<space>k', '<C-w>n')
nmap('<space>K', '<C-w>N')
nmap('<space>l', '<C-w>s')
nmap('<space>L', '<C-w>S')

nmap('<space><space>', '<cmd>w<cr>')

nmap('<leader>cl', ':set bg=light<cr>')
nmap('<leader>cd', ':set bg=dark<cr>')
nmap('<leader>cx', ':!chmod +x %<cr>')
nmap('<leader>xx', '<cmd><cr><cmd>source %<cr>')

-- TODO need to get the module name from the path returned by %, or find a way to find the path of the current module
--nmap('<leader>xr', 'R(vim.fn.expand("%"))')




nmap('<C-e>', '3<C-e>')
nmap('<C-y>', '3<C-y>')

imap(',', ',<c-g>u')
imap('.', '.<c-g>u')
imap('!', '!<c-g>u')
imap('?', '?<c-g>u')


nmap('<C-p>', '<cmd>Telescope find_files<cr>')
nmap('<leader>rf', ':Telescope find_files<cr>')
nmap('<leader>rg', ':Telescope live_grep<cr>')
nmap('<leader>rh', ':Telescope help_tags<cr>')

nmap('<leader>tn', ':TestNearest<cr>')
nmap('<leader>tf', ':TestFile<cr>')
nmap('<leader>ts', ':TestSuite<cr>')
nmap('<leader>tl', ':TestLast<cr>')
nmap('<leader>tv', ':TestVisit<cr>')


vim.cmd[[
let test#strategy = "neovim"
"let test#python#pytest#options = '-s'
]]

