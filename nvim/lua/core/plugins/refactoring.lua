local opts = {
  prompt_func_return_type = {
    go = true,
    java = true,
    py = true,
    cpp = true,
    c = true,
    h = true,
    hpp = true,
    cxx = true,
  },
  prompt_func_param_type = {
    go = true,
    java = true,
    py = true,
    cpp = true,
    c = true,
    h = true,
    hpp = true,
    cxx = true,
  },
  printf_statements = {
    printf_statements = {
      -- add a custom printf statement for cpp
      cpp = {
        'std::cout << "%s" << std::endl;',
      },
    },
  },
  print_var_statements = {
    -- add a custom print var statement for cpp
    cpp = {
      'printf("a custom statement %%s %s", %s)',
    },
    lua = {
      'print("custom print_var %s", vim.inspect(%s))',
    },
    py = {
      'print(f"custom print_var %s {str(%s)}")',
    },
    ts = {
      'console.log("custom print var %s %%s", %s);',
    },
  },
}

return {
  "ThePrimeagen/refactoring.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({ opts })
    local keys = require("keymaps").refactor
    keys()
  end,
}
