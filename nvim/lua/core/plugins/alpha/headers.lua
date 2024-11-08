local headers = {
  require("core.plugins.alpha.images"),
  require("core.plugins.alpha.wordart"),
}

return setmetatable(headers, {
  __index = function(tb, key)
    if key == "random" then
      -- Choose a random sub-table inside headers (imgs | banners)
      local ks = vim.tbl_keys(tb)
      local sub = tb[ks[math.random(#ks)]]

      -- Obtain keys and return a random banner
      local keys = vim.tbl_keys(sub)
      return sub[keys[math.random(1, #keys)]]
    else
      -- Return the desired banner
      return tb[key]
    end
  end,
})
