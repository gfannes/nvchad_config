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

    ['-b'] = {'o{<cr>}<esc>k$'},
    ['-r'] = {'O#include <><esc>i'},
    ['-n'] = {'oMSS_BEGIN(bool);<cr>MSS_END();<esc>k$'},
    ['-N'] = {'oMSS_BEGIN(auro_ReturnCode_t);<cr>MSS_END();<esc>k$'},
    ['-e'] = {'oSECTION("")<cr>{<cr>}<esc>kk$hi'},
    ['-E'] = {'oTEST_CASE_FAST("", "")<cr>{<cr>}<esc>kk$5hi'},
    ['-u'] = {'oREQUIRE();<esc>hi'},
    ['-U'] = {'oREQUIRE_MSS();<esc>hi'},
    ['-y'] = {'i" <<  << "<esc>4hi'},

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
