#!/usr/bin/env lua
return {

  { "preservim/vim-markdown", event = "VeryLazy" },
  ft = { "markdown" },
  { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" }, event = "VeryLazy" },
  { -- Markdown previewing (only for Mac and Windows)
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    enabled = function()
      if vim.g.is_win or vim.g.is_mac then
        return true
      end
      return false
    end,
    build = "cd app && npm install",
    ft = { "markdown" },
  },
  {
    "rhysd/vim-grammarous",
    enabled = true,
    ft = { "markdown" },
  },
}
