local conf = vim.g.config
-- ensure_installed = conf.treesitter_ensure_installed,
return {
  "williamboman/mason-lspconfig.nvim",

  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
  -- This setting has no relation with the `automatic_installation` setting.
  ---@type string[]
  opts = {
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = conf.lsp_servers,

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    ---@type boolean
    automatic_installation = true,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
  },
}
