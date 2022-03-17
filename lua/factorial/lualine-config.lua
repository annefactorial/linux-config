local section_options = {
    lualine_a = {
        {'filename', symbols = { modified = '*'}},
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'diagnostics', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {}
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = section_options,
    inactive_sections = section_options,
    --tabline = {},
    --tabline = {
    --    lualine_a = {function() return 'this is a test of the status bar line thing for neovim woo' end},
    --},
    extensions = {
        'nvim-tree',
        'quickfix',
    },
}


--local function hello()
--    return [[hello world]]
--end
--sections = { lualine_a = { hello } }
--
--sections = { lualine_a = {'FugitiveHead'} }
--sections = { lualine_c = {'%=', '%t%m', '%3p'} }
--sections = { lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" } }
