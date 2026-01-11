local luasnip = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local r = require "luasnip.extras".rep
local f = luasnip.function_node

local lowercaseFirstLetter = function(index)
  return f(function(args)
    return args[1][1]:sub(1, 1):lower() .. args[1][1]:sub(2)
  end, { index })
end

local uppercaseFirstLetter = function(index)
  return f(function(args)
    return args[1][1]:sub(1, 1):upper() .. args[1][1]:sub(2)
  end, { index })
end

return {
  s(
    "newschema",
    fmt([=[
type {cName0} {{
  id: Int!
  {props0}
}}

input New{cName1} {{
  {props1}
}}

type Query {{
  {sNames0}: [{cName2}!]
  {sName0}(id: Int!): {cName3}
  search{cNames0}(name: String!): [{cName5}!]
}}

type Mutation {{
  add{cName6}({sName1}: New{cName8}!): {cName9}
}}
]=], {
      cName0 = i(1),
      cName1 = r(1),
      cName2 = r(1),
      cName3 = r(1),
      cName5 = r(1),
      cName6 = r(1),
      cName8 = r(1),
      cName9 = r(1),
      props0 = i(2),
      props1 = r(2),
      sName0 = lowercaseFirstLetter(1),
      sName1 = lowercaseFirstLetter(1),
      sNames0 = i(3),
      cNames0 = uppercaseFirstLetter(3),
    })
  ),

  ------------------------------------------------------ Snippets goes here
}
