#!/usr/bin/env lua

local langs = {require("core.plugins.lang-support.nvim-jdtls"), require("core.plugins.lang-support.markdown"),
               require("core.plugins.lang-support.go"), require("core.plugins.lang-support.rust-tools"), {
    "skywind3000/asyncrun.vim",
    lazy = true,
    cmd = {"AsyncRun"}
}, { -- asynctasks for asyncrun
    "skywind3000/asynctasks.vim",
    event = "VeryLazy"
}, -- { 'scalameta/nvim-metals' },
{
    "cespare/vim-toml",
    event = "VeryLazy",
    ft = {"toml"},
    branch = "main"
}, {
    "andrewstuart/vim-kubernetes",
    event = "VeryLazy"
}, {
    "ekalinin/Dockerfile.vim", -- Docker support
    event = "VeryLazy"
}, {
    "elzr/vim-json",
    event = "VeryLazy"
}, {
    "hashivim/vim-terraform", -- terraform
    event = "VeryLazy"
}, {
    "hsanson/vim-openapi",
    event = "VeryLazy"
}, {
    "neomake/neomake", -- code checker
    event = "VeryLazy"
}}

return langs
