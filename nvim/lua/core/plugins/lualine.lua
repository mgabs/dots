local options = {
  theme = "auto",
  icons_enabled = true,
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = {
      "branch",
      "diff",
      {
        "diagnostics",
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = "DiagnosticError", -- Changes diagnostics' error color.
          warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
          info = "DiagnosticInfo", -- Changes diagnostics' info color.
          hint = "DiagnosticHint", -- Changes diagnostics' hint color.
        },
        symbols = { error = " ", warn = " ", info = " ", hint = "💡" },
        colored = true, -- Displays diagnostics status in color if set to true.⛩️
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opt = true,
    },
  },
  opts = {
    extensions = vim.g.config.plugins.lualine.extensions,
    sections = {
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = true, -- Display new file status (new file means no write after created)
          path = 1, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
  config = function(_, opts)
    if vim.g.config.plugins.copilot.enable then
      local lsp_utils = require("core.plugins.lsp.utils")
      local utils = require("core.utils.functions")
      local function list_LSP_clients()
        local clients = lsp_utils.get_LSP_clients()
        local list = {}
        for _, client in ipairs(clients) do
          table.insert(list, client.name)
          -- TODO only indicate a running copilot?
          -- if client.name == "copilot" then
          --   local icons = require("core.utils.icons")
          --   return icons.apps.Copilot
          -- end
        end
        return table.concat(list, "|")
      end
      opts.sections = {
        lualine_a = {
          {
            list_LSP_clients,
            cond = function()
              return utils.table_length(lsp_utils.get_LSP_clients()) > 0
            end,
          },
        },
      }
    end

    require("lualine").setup(options)
  end,
}
