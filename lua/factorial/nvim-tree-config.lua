vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1

require('nvim-tree').setup({
    disable_netrw = true,
    auto_close = false,
    open_on_tab = true,
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    update_cwd = true,

    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    filters = {
        custom = {
            '*.tmp',
            '.git',
            '*.pyc',
        }
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },

    view = {
        width = 30,
        side = 'left',
        preserve_window_proportions = false,
        signcolumn = 'auto',
        mappings = {
            custom_only = false,
            list = {
                { key = "s", action = "" },
                { key = "S", action = "" },
                { key = "H", action = "" },

                { key = "T", action = "first_sibling" },
                { key = "N", action = "last_sibling" },

                { key = "<C-a>", action = "toggle_dotfiles" },
                { key = "<C-e>", action = "" },
            }
        }
    },

    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
