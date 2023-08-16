---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gt"] = {":bnext<cr>"},
    ["gT"] = {":bprevious<cr>"},
  },
}

-- more keybinds!

return M
