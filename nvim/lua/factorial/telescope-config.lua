local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        layout_config = {
            width = 0.75,
            prompt_position = "top",
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        find_command = {
            'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
        },
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        bookmarks = {
            -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
            selected_browser = 'firefox',

            -- Either provide a shell command to open the URL
            url_open_command = 'firefox',

            -- Or provide the plugin name which is already installed
            -- Available: 'vim_external', 'open_browser'
            url_open_plugin = nil,

            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = true,

            -- Provide a custom profile name for Firefox
            firefox_profile_name = 'default-release',
        },
    },
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('bookmarks')

local M = {}
M.search_vim_config = function()
    require('telescope.builtin').find_files({
        prompt_title = '< VimRC >',
        cwd = '~/.config/nvim/',
    })
end

return M
