require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "typescript",
        "json",
        "lua",
        "python",
        "regex",
        "toml",
        "vim",
        "vue",
        "yaml",
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {
            "python"
        },
    },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})
