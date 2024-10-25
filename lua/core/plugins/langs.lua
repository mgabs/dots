#!/usr/bin/env lua

local langs = {
  require("core.plugins.language-servers.nvim-jdtls"),
  require("core.plugins.language-servers.markdown"),
  require("core.plugins.language-servers.go"),
  require("core.plugins.language-servers.rust-tools"),

  { "skywind3000/asyncrun.vim", lazy = true, cmd = { "AsyncRun" } },
  { "skywind3000/asynctasks.vim", event = "VeryLazy" }, -- asynctasks for asyncrun
  -- 'scalameta/nvim-metals'
  { "cespare/vim-toml", event = "VeryLazy", ft = { "toml" }, branch = "main" },
  {
    "andrewstuart/vim-kubernetes",
    event = "VeryLazy",
  },
  {
    "ekalinin/Dockerfile.vim", -- Docker support
    event = "VeryLazy",
  },
  {
    "elzr/vim-json",
    event = "VeryLazy",
  },
  {
    "hashivim/vim-terraform", -- terraform
    event = "VeryLazy",
  },
  {
    "hsanson/vim-openapi",
    event = "VeryLazy",
  },
  {
    "neomake/neomake", -- code checker
    event = "VeryLazy",
  },
}

return langs
