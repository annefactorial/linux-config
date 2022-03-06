require('nvim-tree').setup({
    filters = {
        custom = {'*.tmp', '.git'}
    },
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {'dashboard'},
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {}
    },

    view = {
        width = 30,
        side = 'left',
        auto_resize = true,
        mappings = {custom_only = false, list = {}}
    }
})
