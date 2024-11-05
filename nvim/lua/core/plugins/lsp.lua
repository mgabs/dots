local M = {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {{"onsails/lspkind-nvim"}, {
        "folke/neodev.nvim",
        config = true,
        lazy = true,
        ft = "lua"
    }},
    config = function()
        require("core.config.lsp")
    end
}

return M
