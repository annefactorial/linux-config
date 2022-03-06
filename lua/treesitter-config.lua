require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
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
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,
    },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    autopairs = {
        enable = true,
    },
})
