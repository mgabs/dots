local spectreKeys = require("keymaps").spectre

return {
  "nvim-pack/nvim-spectre",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  enabled = vim.g.config.plugins.spectre.enable,
  keys = spectreKeys(),
}
