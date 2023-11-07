local luasnip = require("luasnip")
local fmt = require "luasnip.extras.fmt".fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node
local c = luasnip.choice_node
local r = require "luasnip.extras".rep
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
        OR: [
          {{ name: {{ contains: name.toLowerCase() }} }},
          {{ nameAr: {{ contains: name }} }},
        ],
      }},
      include: {{ {include2} }},
    }});
  }}

  @Mutation('add{cName2}')
  async add{cName3}(@Args('{sName5}') {sName6}: New{cName4}) {{
    return this.service.{sName7}.create({{
      data: {{
        name: {sName8}.name,
        nameAr: {sName9}.nameAr,
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
        sName8 = lowercaseFirstLetter(1),
        sName9 = lowercaseFirstLetter(1),
        sNames0 = lowercaseFirstLetter(2),
        sNames1 = lowercaseFirstLetter(2),
      include0 = i(3),
      include1 = r(3),
      include2 = r(3),
      i(4),
    })
  ),

  ------------------------------------------------------ Snippets goes here
}
