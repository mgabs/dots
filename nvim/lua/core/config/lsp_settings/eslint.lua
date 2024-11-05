#!/usr/bin/env lua
local util = require("lspconfig.util")

return {
  format = false,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  codeAction = {
    enable = true,
    disableRuleComment = {
      enable = true,
      location = "separateLine",
    },
    showDocumentation = {
      enable = true,
    },
  },
  codeActionOnSave = {
    enable = true,
    mode = "all",
  },
  workingDirectory = {
    mode = "location",
  },
  root_dir = util.root_pattern(
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
    -- Disabled to prevent "No ESLint configuration found" exceptions
    -- 'package.json',
  ),
}
