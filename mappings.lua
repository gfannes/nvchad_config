---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gt"] = {":bnext<cr>"},
    ["gT"] = {":bprevious<cr>"},
    ['<leader>bp'] = {':b#<cr>'},
  },
}

-- more keybinds!

return M
