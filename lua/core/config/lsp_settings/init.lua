local nvim_lsp = require("lspconfig")
local lsp_utils = require("core.plugins.lsp.utils")

local M = {}
M.lua = require("core.config.lsp_settings.lua_ls")
M.json = require("core.config.lsp_settings.jsonls")
M.tex = require("core.config.lsp_settings.tex")
M.yaml = require("core.config.lsp_settings.yaml")
M.ltex = require("core.config.lsp_settings.ltex")
M.python = require("core.config.lsp_settings.python")
M.redhat = require("core.config.lsp_settings.redhat")

M.configure_lsp = function(lsp_server, caps, settings)
  if lsp_server == "rust_analyzer" then
    -- vim.notify("rust_analyzer is managed by rust-tools", vim.log.levels.INFO, { title = "LSP config" })
  end

  nvim_lsp[lsp_server].setup({
    before_init = function(_, config)
      if lsp_server == "pyright" then
        config.settings.python.pythonPath = lsp_utils.get_python_path(config.root_dir)
      end
    end,
    capabilities = caps,
    flags = {
      debounce_text_changes = 150,
    },
    settings = settings,
  })
end

return M
