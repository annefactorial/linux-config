local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Notes",
    finder = finders.new_table {
      results = {
        { "red", "#ff0000" },
        { "green", "#00ff00" },
        { "blue", "#0000ff" },
      },
      entry_Maker = function(entry)
        -- convert an entry from the results table
        return {
        -- reference to original value
          value = entry,
          display = entry[1],
          -- sorting key
          ordinal = entry[1],
        }
      end
    },

    sorter = conf.generic_sorter(opts),

    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print(vim.inspect(selection))
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,

  }):find()
end

colors(require('telescope.themes').get_cursor{})

return M
