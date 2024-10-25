#!/usr/bin/env lua
return {
  {
    "glepnir/nerdicons.nvim",
    cmd = "NerdIcons",
    config = function()
      require("nerdicons").setup({
        border = "single", -- Border
        prompt = "󰨭 ", -- Prompt Icon
        preview_prompt = " ", -- Preview Prompt Icon
        width = 0.5, -- flaot window width
        down = "<Down>", -- Move down in preview
        up = "<Up>", -- Move up in preview
        copy = "<C-c>", -- Copy to the clipboard
      })
    end,
  },
}
