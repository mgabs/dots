-- As defining all of the snippet-constructors (s, c, t, ...) in every file is rather cumbersome,
-- luasnip will bring some globals into scope for executing these files.
-- defined by snip_env in setup
require("luasnip.loaders.from_lua").lazy_load()
local env = snip_env

local luasnip = require("luasnip")
local text = luasnip.text_node
local insert = luasnip.insert_node

return {
  env.s("print", {
    text("System.out.println("),
    insert(1),
    text(");"),
  }),
}
