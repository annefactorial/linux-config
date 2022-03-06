vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command) map('n', shortcut, command) end
function imap(shortcut, command) map('i', shortcut, command) end
function vmap(shortcut, command) map('v', shortcut, command) end
function cmap(shortcut, command) map('c', shortcut, command) end
function tmap(shortcut, command) map('t', shortcut, command) end

nmap('<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})


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

nmap(',h', ':nohl<cr>')

nmap('-', 'mzJ`z')
nmap('Q', 'gqap')
nmap('<C-w>h', '<C-w>h')
nmap('<C-w>t', '<C-w>j')
nmap('<C-w>n', '<C-w>k')
nmap('<C-w>s', '<C-w>l')

imap('<C-c>', '<esc>')
nmap('<leader>h', '<C-w>h')
nmap('<leader>t', '<C-w>j')
nmap('<leader>n', '<C-w>k')
nmap('<leader>s', '<C-w>l')
nmap('<leader>v', ':vsplit<cr>')
nmap('<leader>S', ':split<cr>')
nmap('<leader>|', '<C-w>|')
nmap('<leader>=', '<C-w>=')

nmap('<leader><leader>', ':wa<cr>')

nmap('<C-e>', '3<C-e>')
nmap('<C-y>', '3<C-y>')

imap(',', ',<c-g>u')
imap('.', '.<c-g>u')
imap('!', '!<c-g>u')
imap('?', '?<c-g>u')
