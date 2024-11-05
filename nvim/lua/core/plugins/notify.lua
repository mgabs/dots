return {
  "rcarriga/nvim-notify",
  lazy = true,
  init = function()
    vim.notify = function(...)
      vim.notify = require("notify")
      vim.notify.setup({
      background_colour = "#000000",
      })

      return vim.notify(...)
    end
  end,
}
