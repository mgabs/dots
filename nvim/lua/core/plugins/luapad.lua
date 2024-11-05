local keys = require("keymaps")

local M = {
  "rafcamlet/nvim-luapad",
  event = "VeryLazy",
  ft = "lua",
  config = function()
    keys.luapad()
  end,
}

return M
