-- see ./lua/core/config/defaults.lua for all
-- possible values and a short description

return {
  options = {
    showtabline = 1,
    relativenumber = false,
    timeout = true,
    timeoutlen = 500,
    ttimeoutlen = 10,
    ignorecase = true, -- All your searches will be case-insensitive.
    smartcase = true,  -- Your search will be case-sensitive if it contains an uppercase letter.
  },
  plugins = {
    alpha = {
      disable_dashboard_header = false,
    },
    spectre = {
      enable = true,
    },
    noice = {
      enable = true,
    },
  },
  theme = {
    -- select theme
    name = "palenight",
    -- name = "catppuccin-mocha",
    -- choose variants
    catppuccin = {
      -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      variant = "catppuccin-mocha",
    },
  },
  -- LSPs that should be installed by Mason-lspconfig
  lsp_servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "gopls",
    "ltex",
    "marksman",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "tailwindcss",
    "terraformls",
    "texlab",
    "ts_ls",
    "typst_lsp",
    "yamlls",
    "jqls",
    "jdtls",
  },

  -- Tools that should be installed by Mason
  tools = {
    -- Formatter
    "black",
    "prettier",
    "stylua",
    "shfmt",
    -- Linter
    "eslint_d",
    "shellcheck",
    "tflint",
    "yamllint",
    "ruff",
    -- DAP
    "debugpy",
    "codelldb",
    "autopep8",
    -- "autoflake",
    "flake8",
    "jq",
    -- "awk-language-server",
  },
}
