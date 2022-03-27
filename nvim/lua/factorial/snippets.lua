local ls = require("luasnip")

-- Define a snippet
local s = ls.s

-- Text node
local t = ls.t

-- Function node
local f = ls.f

-- Format node
local fmt = require('luasnip.extras.fmt').fmt

-- Insert node
local i = ls.insert_node

-- Dynamic node
local d = ls.dynamic_node

-- Snippet node, return from dynamic node
local sn = ls.sn

-- Choice node
local c = ls.choice_node

-- Repeat a node
local rep = require('luasnip.extras').rep

local same = function(index)
    return f(function(arg)
        return arg[1]
    end, {index})
end


ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
        ls.parser.parse_snippet("{", "{\n   $0\n}"),
        ls.parser.parse_snippet("ref", "[[$1]]$0"),

        s('curtime', f(function()
            return os.date "%D - %H:%M"
        end)),

        s('sametest', fmt([[example: {}, function: {}]], { i(1), same(1) })),
    },

    lua = {
        s('req', fmt("local {} = require('{}')", {
            -- insert node #1
            i(1, "module"),
            -- repeat whatever is in node #1
            rep(1),
        })),

        s('req2', fmt(
            [[local {} = require("{}")]],
            {
                f(function(import_name)
                    local parts = vim.split(import_name[1][1], ".", true)
                    return parts[#parts] or ""
                end, { 1 }),

                i(1),
            }
        )),

        s('todo', fmt([[
            {}
        ]], { c(1, {
            t"- [ ]",
            t"- [x]",
        })})),

        --s('todo', fmt([[ ]])
    },

    python = {
    }
    
}
