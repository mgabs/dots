#!/usr/bin/env lua
local lspconfig = require("lspconfig")
local utils = require("utils")

-- prev connfigs
lspconfig.pylsp.setup({
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    pylsp = {
      plugins = {
        maxLineLength = 120,
        -- jedi_completion = {
        --   include_class_objects = true,
        --   include_function_objects = true,
        -- },
        -- jedi = {
        --   environment = os.getenv("VENV_PATH_PYLSP"),
        -- },
        -- note each python application may require different
        -- virtual environment, users need to add
        -- path to specific venv when typing command
        -- `nvim /path/to/file.py`
        rope_completion = { "eager" },
        rope_rename = {
          enabled = true,
        },
      },
    },
  },
})
