---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- My keybindings
    ["gt"] = {":bnext<cr>"},
    ["gT"] = {":bprevious<cr>"},
    ['<leader>bp'] = {':b#<cr>'},

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
