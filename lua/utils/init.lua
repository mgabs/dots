#!/usr/bin/env lua
-- Util helper module --
-- NOTE: Current Lua version is 5.1 in neovim 0.8
-- Learn nvim-lua: https://github.com/nanotee/nvim-lua-guide
local util = {}

util.icons = require("utils.icons")
util.funcs = require("utils.functions")
util.keymap = require("utils.keymap")
util.lsp = require("utils.lsp")

-- overloading util
util = util.funcs.overload(util, util.funcs)
util = util.funcs.overload(util, util.keymap)

function util.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local plugin = require("lazy.core.plugin")
  return plugin.values(plugin, "opts", false)
end

return util
