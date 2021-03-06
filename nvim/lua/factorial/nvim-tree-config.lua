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
    hijack_unnamed_buffer_when_opening = false,
    hijack_cursor = true,
    update_cwd = false,

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
        },
    },

    diagnostics = {
        enable = false,
        show_on_dirs = false,
    },

    view = {
        width = 30,
        side = 'left',
        preserve_window_proportions = true,
        signcolumn = 'auto',
        mappings = {
            custom_only = false,
            list = {


                { key = "s", action = "" },
                { key = "S", action = "" },
                { key = "H", action = "" },
                { key = "J", action = "" },

                { key = "T", action = "first_sibling" },
                { key = "N", action = "last_sibling" },

                { key = "dd", action = "cut" },
                { key = "D", action = "remove" },


                { key = "yy", action = "copy" },
                { key = "Y", action = "copy_name" },
                { key = "gy", action = "copy_path" },
                { key = "gY", action = "copy_absolute_path" },

                { key = "m", action = "rename" },
                { key = "a", action = "create" },

                { key = "<C-p>", action = "dir_up" },

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
