-- inspired by https://github.com/LunarVim/LunarVim/tree/master
-- but heavily stripped down
local M = {}
local utils = require("utils.functions")
local config_file = "/.config/nvim/lua/config.lua"

-- -- TODO:
-- local function validate_config(config)
-- end

function M.init()
    local user_config = utils.load_user_config(config_file)
    -- validate_config(user_config)

    -- Merge defaults and user config
    vim.g.config = utils.merge_tables(require("core.config.defaults"), user_config)

    -- configure vim.opt
    for k, v in pairs(vim.g.config.options) do
        vim.opt[k] = v
    end

    -- set theme
end

return M
