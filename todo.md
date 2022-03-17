- consider a top of the screen lualine that pulls arbitrary text out of like a database
    - or anything else for that matter

- Make a custom plugin that is like paredit for html
    - i want to be able to slurp and barf blocks of html, wrap a selection in a new tag, etc
    - this would make frontend editing with tailwind much nicer
    - use treesitter html
    - basically just port tagedit to lua
        - https://github.com/magnars/tagedit
        - https://emacs.stackexchange.com/questions/14970/editing-html-structurally

- Make a custom dumb indentation plugin
    - if the line above me ends in one of  `(` `{` `[` `:` indent one over
    - if the line above me ends in `>`, and does not start with `</`, indent
    - else indent to what the line above me has as its indention level

- Set up my github profile
- Pass over backup files/swap settings

- Autoformatting with efm-langserver
    https://github.com/mattn/efm-langserver

- Consider trouble plugin for inline errors
    https://github.com/folke/trouble.nvim

- Set up keybindings for more complicated cmp things
- Set up code actions and such
    https://github.com/glepnir/lspsaga.nvim

- Fix triple quoted strings in python conflicting with autopairs
    Try using treesitter to avoid this?

- Configure LuaSnip, watch the video about installing
    - For a given buffer type (like, edgedb),
        - Create very precise snippets, like
            - `,p` = 'property'
            - `,rp` = 'required property'

            - `,l` = 'link'
            - `,ml` = 'multi link'
            - `,rl` = 'required link'
            - `,rml` = 'required multi link'

            - `,at` = 'abstract type $1 {\n$2\n}'
            - `,at` = 'abstract type $1 {\n$2\n}'
            - `,t` = 'type $1 {\n$2\n}'
            - `,te` = 'type $1 extends $2 {\n$3\n}'
            - `,m` = 'type $1 {\n$2\n}'
    - Add a python snip for ipdb set trace

- For filetype edgedb, `set indentexpr=GetJavascriptIndent()`, works quite well

- Allow using ctrl+u in telescope to clear the search

- Consider any interesting enhancements to nvim tree, make custom actions that can be run on any of the tree's events, like on open file - they can all be customized
