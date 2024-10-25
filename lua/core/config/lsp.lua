local conf = vim.g.config
local nvim_lsp = require("lspconfig")
local utils = require("core.plugins.lsp.utils")
local lsp_settings = require("core.config.lsp_settings")
local funcs = require("utils.functions")

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- enable autoclompletion via nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

funcs.on_attach(function(client, buffer)
    require("lsp-format").on_attach(client, buffer)
    require("core.plugins.lsp.keys").on_attach(client, buffer)
end)

for _, lsp in ipairs(conf.lsp_servers) do
    local settings = {}

    if lsp == "json" then
        settings = lsp_settings.json
    elseif lsp == "lua" then
        settings = lsp_settings.lua
    elseif lsp == "ltex" then
        settings = lsp_settings.ltex
    elseif lsp == "redhat" then
        settings = lsp_settings.redhat
    elseif lsp == "texlab" then
        settings = lsp_settings.tex
    elseif lsp == "yaml" then
        settings = lsp_settings.yaml
    elseif lsp == "python" then
        settings = lsp_settings.python.opts
    end
    lsp_settings.configure_lsp(lsp, capabilities, settings)
end

vim.api.nvim_create_user_command("LtexLang", "lua require('core.plugins.lsp.utils').set_ltex_lang(<q-args>)", {
    nargs = 1,
    desc = "Set ltex-ls language"
})
vim.api.nvim_set_keymap("n", "<leader>mx",
    "<cmd>lua require('core.plugins.lsp.utils').set_ltex_lang(vim.g.config.plugins.ltex.additional_lang)<cr>", {
        desc = "Set ltex-ls language"
    })

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", {
    text = "🆇",
    texthl = "DiagnosticSignError"
})
vim.fn.sign_define("DiagnosticSignWarn", {
    text = "⚠️",
    texthl = "DiagnosticSignWarn"
})
vim.fn.sign_define("DiagnosticSignInfo", {
    text = "ℹ️",
    texthl = "DiagnosticSignInfo"
})
vim.fn.sign_define("DiagnosticSignHint", {
    text = "",
    texthl = "DiagnosticSignHint"
})
