local Hydra = require("hydra")
local keys = require("keymaps.plugins").hydra

local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local hint = [[
 _J_: next                 _K_: previous
 _a_: add word             _l_: list corrections
 _f_: use first correction

 ^
 _q_: Exit
]]

Hydra({
  name = "Spelling",
  hint = hint,
  config = {
    invoke_on_body = true,
    hint = {
      position = "bottom",
      border = "rounded",
    },
  },
  mode = "n",
  body = keys.spelling,
  heads = {
    { "J", "]s" },
    { "K", "[s" },
    { "a", "zg" },
    { "l", cmd("Telescope spell_suggest") },
    { "f", "1z=" },
    { "q", nil, { exit = true, nowait = true } },
  },
})
