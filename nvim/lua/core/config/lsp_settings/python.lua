-- https://microsoft.github.io/pyright/#/settings

-- from
-- https://github.com/neovim/nvim-lspconfig/blob/04e4d00674cd0e5505cbaf977cd7988301626f2f/lua/lspconfig/server_configurations/pyright.lua

local M = {}
M.opts = {
  disableLanguageServices = false,
  disableOrganizeImports = false,
  openFilesOnly = false,
  analysis = {
    autoImportCompletions = true,
    autoSearchPaths = true,
    diagnosticMode = "workspace",
    typeCheckingMode = "basic",
    useLibraryCodeForTypes = true,
    filetypes = { "python" },
    single_file_support = true,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
}

M.root_files = {
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
}

M.organize_imports = function()
  local params = {
    command = "pyright.organizeimports",
    arguments = { vim.uri_from_bufnr(0) },
  }
  vim.lsp.buf.execute_command(params)
end

return M
