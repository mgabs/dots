local Hydra = require("hydra")
local gitsigns = require("gitsigns")
local keys = require("keymaps.plugins").hydra

local hint = [[
 _J_: next hunk _K_: prev hunk
^^^^
_q_: exit
]]

local opts = { exit = true, nowait = true }

Hydra({
  hint = hint,
  config = {
    color = "pink",
    invoke_on_body = true,
    hint = {
      position = "bottom",
      border = "rounded",
    },
  },
  mode = { "n", "x" },
  body = keys.git,
  heads = {
    {
      "J",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end,
      { expr = true },
    },
    {
      "K",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end,
      { expr = true },
    },
    { "q", nil, opts },
  },
})
