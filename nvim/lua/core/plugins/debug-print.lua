#!/usr/bin/env lua
local keys = require("keymaps.plugins")

local options = {
  -- create_keymaps = false, -- 	Creates default keymappings - see above
  move_to_debugline = true, --	When adding a debug line, moves the cursor to that line
  display_counter = true, --	Whether to display/include the monotonically increasing counter in each debug message added
  display_snippet = true, --Whether to include a snippet of the line above/below in plain debug lines
  -- filetypes=	 , --See below 	Custom filetypes - see below
  -- ignore_treesitter = false, --	Never use treesitter to find a variable under the cursor, always prompt for it - overrides the same setting on debugprint() if set to true
  print_tag = "DEBUGPRINT", --The string inserted into each print statement, which can be used to uniquely identify statements inserted by debugprint.
}

return {
  "andrewferrier/debugprint.nvim",
  -- Dependency only needed for NeoVim 0.8
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  -- Remove the following line to use development versions,
  -- not just the formal releases
  version = "*",
  config = function()
    require("debugprint").setup(options)
    keys.debugPrint()
  end,
}
