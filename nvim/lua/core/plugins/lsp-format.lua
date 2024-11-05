#!/usr/bin/env lua

return {
  "lukas-reineke/lsp-format.nvim",
  event = "VeryLazy",
  setup = function()
    require("lsp-format").setup({})
  end,
}
