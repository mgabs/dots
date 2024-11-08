local conf = vim.g.config.plugins.kustomize
local M = {
  "allaman/kustomize.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = "yaml",
  config = true,
  opts = conf.opts,
  dev = conf.dev,
}

return M
