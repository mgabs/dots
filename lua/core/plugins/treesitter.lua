local M = {
  "nvim-treesitter/nvim-treesitter",
  enabled = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  -- event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "mfussenegger/nvim-ts-hint-textobject",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/playground",
  },
  config = function()
    local conf = vim.g.config
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      ensure_installed = conf.treesitter_ensure_installed,
      ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
      endwise = {
        enable = true,
      },
      indent = { enable = true },
      autopairs = { enable = true },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = conf.treesitter_keymaps,
        },
      },
    })

    require("nvim-ts-autotag").setup()
  end,
}

return M
