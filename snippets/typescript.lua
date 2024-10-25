-- As defining all of the snippet-constructors (s, c, t, ...) in every file is rather cumbersome,
-- luasnip will bring some globals into scope for executing these files.
-- defined by snip_env in setup
require("luasnip.loaders.from_lua").lazy_load()
local env = snip_env

local luasnip = require("luasnip")
local text = luasnip.text_node
local insert = luasnip.insert_node

return {
  --[[
    const $1 = ($2)$3 => {
      $4
    }
    ]]
  --
  env.s("afn", {
    text("const "),
    insert(1),
    text(" = ("),
    insert(2),
    text(")"),
    insert(3),
    text({ " => {", "\t" }),
    insert(4),
    text({ "", "}" }),
  }),
  -- export interface
  env.s("exint", {
    text("export interface "),
    insert(1, "name"),
    text({ "{", "\t" }),
    text({ "\t k: val", "\t" }),
    text("}"),
  }),
  -- export function
  env.s("exfunc", {
    text("export function "),
    insert(1, "name"),
    text("("),
    insert(2, "arg"),
    text(": "),
    insert(3, "typ"),
    text({ ") {", "}" }),
  }),
  -- export class
  env.s("exclass", {
    text("export class "),
    insert(1, "name "),
    text({
      "extends Construct {",
      "	constructor(scope: Construct, id: string) {",
      "\tsuper(scope, id);",
      "\t}",
      "}",
    }),
  }),
}
