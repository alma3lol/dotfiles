local ls = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local rn = ls.restore_node
local r = require "luasnip.extras".rep
local ai = require("luasnip.nodes.absolute_indexer")
local u = function(index)
  return f(function(args)
    return args[1][1]:upper()
  end, { index })
end
local l = function(index)
  return f(function(args)
    return args[1][1]:lower()
  end, { index })
end


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

local rec_graphql_query_variable = function(_, snip)
  if not snip.rows then
    snip.rows = 1
  end
  local nodes = {}
  local ins_indx = 1
  for j = 1, snip.rows do
    table.insert(nodes, rn(ins_indx, tostring(j) .. "x1", fmt([[{}: {}]], { i(1), c(2, { t('string'), t('number') }) })))
    ins_indx = ins_indx + 1
    table.insert(nodes, t({ "", "\t\t" }))
  end
  nodes[#nodes] = t ""
  return sn(nil, nodes)
end

local convert_typescript_variable_to_graphql_input = function(input_str)
  local propery_name, type_name = string.gmatch(input_str, "([^ ]+): (.*)")()
  if propery_name == nil or type_name == nil then
    return ""
  end
  if type_name == "string" then
    return "$" .. propery_name .. ": String!"
  elseif type_name == "number" then
    return "$" .. propery_name .. ": Int!"
  else
    return "$" .. propery_name .. ": " .. type_name .. "!"
  end
end

local get_query_variables_from_text = function(index)
  return f(function(args)
    local content = {}
    for _, value in ipairs(args[1]) do
      local v = convert_typescript_variable_to_graphql_input(value)
      if v ~= "" then
        table.insert(content, v)
      end
    end
    if #content == 0 then
      return ""
    end
    return "(" .. table.concat(content, ', ') .. ")"
  end, { index })
end

local convert_typescript_variable_to_graphql_query_input = function(input_str)
  local propery_name = string.gmatch(input_str, "([^ ]+): ")()
  if propery_name == nil then
    return ""
  end
  return propery_name .. ": $" .. propery_name
end

local get_query_variables_into_query_input = function(index)
  return f(function(args)
    local content = {}
    for _, value in ipairs(args[1]) do
      local v = convert_typescript_variable_to_graphql_query_input(value)
      if v ~= "" then
        table.insert(content, v)
      end
    end
    if #content == 0 then
      return ""
    end
    return "(" .. table.concat(content, ', ') .. ")"
  end, { index })
end

return {
  s(
    "gqlresolver",
    fmt([[
import {{ Args, Mutation, Query, Resolver }} from '@nestjs/graphql';
import {{ AppService }} from 'src/app.service';
import {{ New{cName0} }} from 'src/graphql.schema';

@Resolver('{cName1}')
export class {cNames0}Resolver {{
  constructor(private readonly service: AppService) {{}}

  @Query('{sNames0}')
  {sNames1}() {{
    return this.service.{sName0}.findMany({{
      include: {{ {include0} }},
    }});
  }}

  @Query('{sName1}')
  {sName2}(@Args('id') id: number) {{
    return this.service.{sName3}.findUniqueOrThrow({{
      where: {{ id }},
      include: {{ {include1} }},
    }});
  }}

  @Query('search{cNames1}')
  search{cNames2}(@Args('name') name: string) {{
    return this.service.{sName4}.findMany({{
      where: {{
        {}
      }},
      include: {{ {include2} }},
    }});
  }}

  @Mutation('add{cName2}')
  async add{cName3}(@Args('{sName5}') {sName6}: New{cName4}) {{
    return this.service.{sName7}.create({{
      data: {{
        {}
      }}
    }});
  }}
}}
]], {
      cName0 = i(1),
      cName1 = r(1),
      cName2 = r(1),
      cName3 = r(1),
      cName4 = r(1),
      cNames0 = i(2),
      cNames1 = r(2),
      cNames2 = r(2),
      sName0 = lowercaseFirstLetter(1),
      sName1 = lowercaseFirstLetter(1),
      sName2 = lowercaseFirstLetter(1),
      sName3 = lowercaseFirstLetter(1),
      sName4 = lowercaseFirstLetter(1),
      sName5 = lowercaseFirstLetter(1),
      sName6 = lowercaseFirstLetter(1),
      sName7 = lowercaseFirstLetter(1),
      sNames0 = lowercaseFirstLetter(2),
      sNames1 = lowercaseFirstLetter(2),
      include0 = i(3),
      include1 = r(3),
      include2 = r(3),
      i(4),
      i(5),
    })
  ),
  s(
    "whereOrName",
    fmt([[
        OR: [
          {{ name: {{ contains: name.toLowerCase() }} }},
          {{ nameAr: {{ contains: name }} }},
        ],
    ]], {})
  ),
  s(
    "nameAndNameAr",
    fmt([[
        name: {}.name,
        nameAr: {}.nameAr,
    ]], {
      i(1),
      r(1),
    })
  ),
  s(
    "eaf",
    fmt([=[
export * from './{}';
]=], {
      i(1),
    })
  ),

  s(
    "newgqlquery",
    fmt([=[
export const {name1}Query: TypedDocumentNode<
  {{
    {name2}: {type1}
  }},
  {{
    {variables1}
  }}
> = gql`
query {name3}Query{queryVariables1} {{
  {name4}{queryVariables2}{queryReturn}
}}
`;
]=], {
      name1 = i(1),
      type1 = i(2),
      variables1 = d(3, rec_graphql_query_variable, {}, {
        user_args = {
          function(snip) snip.rows = snip.rows + 1 end,
          function(snip) snip.rows = math.max(snip.rows - 1, 1) end
        }
      }),
      name2 = lowercaseFirstLetter(1),
      name3 = r(1),
      name4 = lowercaseFirstLetter(1),
      queryVariables1 = get_query_variables_from_text(3),
      queryVariables2 = get_query_variables_into_query_input(3),
      queryReturn = c(4, {
        t(''),
        sn(1, { t({ " {", "\t\t" }), i(1), t({ "", "\t}" }) }),
      }),
    })
  ),

  ------------------------------------------------------ Snippets goes here
}
