local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local fmt = require"luasnip.extras.fmt".fmt
local s = luasnip.snippet
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local r = require"luasnip.extras".rep
local t = luasnip.text_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node

local rec_where
rec_where = function()
  return sn(nil, {
    c(1, {
      t '',
      sn(nil, {
        t({ '', '\toptional ' }),
        c(1, {
          t 'int32',
          t 'string',
          t 'bool',
          i(1)
        }),
        t ' ',
        i(2),
        t ' = ',
        i(3),
        t ';',
        d(4, rec_where, {}),
      })
    })
  })
end

local rec_fields
rec_fields = function()
  return sn(nil, {
    c(1, {
      t '',
      sn(nil, {
        t({ '', '\toptional bool ' }),
        i(1),
        t ' = ',
        i(2),
        t ';',
        d(3, rec_fields, {}),
      })
    })
  })
end

local rec_include
rec_include = function(args)
  print(vim.inspect(args))
  return sn(nil, {
    c(1, {
      t '',
      sn(nil, {
        t({ '', '\toptional bool ' }),
        i(1),
        t ' = ',
        i(2),
        t ';',
        d(3, rec_include, {}),
      })
    }),
  })
end

local rec_model
rec_model = function()
  return sn(nil, {
    c(1, {
      t '',
      sn(nil, {
        t({ '', '\t' }),
        c(1, {
          t 'int32',
          t 'string',
          t 'bool',
          i(1),
        }),
        t ' ',
        i(2),
        t ' = ',
        i(3),
        t ';',
        d(4, rec_model, {}),
      })
    })
  })
end

return {
    s('protoservice',
        fmt([[
syntax = "proto3";

package {packageName};

service {name1}sService {{
  rpc FetchAll(FetchAll{name2}Request) returns (stream {name3}) {{}}
  rpc FetchOne(FetchOne{name4}Request) returns ({name5}) {{}}
  rpc CreateOne(CreateOne{name6}Request) returns ({name7}) {{}}
  rpc UpdateBulk(UpdateBulk{name8}Request) returns (UpdateBulk{name9}Response) {{}}
  rpc UpdateOne(UpdateOne{name10}Request) returns ({name11}) {{}}
  rpc DeleteBulk(DeleteBulk{name12}Request) returns (DeleteBulk{name13}Response) {{}}
  rpc DeleteOne(Delete{name14}Request) returns (Delete{name15}Response) {{}}
}}

message FetchAll{name16}Request {{
  {name17}Filter filter = 1;
  string token = 2;
}}

message {name18}Filter {{
  optional {name19}Where where = 1;
  optional {name20}Fields fields = 2;
  optional int32 limit = 3;
  optional {name21}Include include = 4;
  repeated string order = 5;
  optional int32 skip = 6;
}}

message {name22}Where {{
  optional int32 id = 1;{whereArgs}
}}

message {name23}Fields {{
  optional bool id = 1;{fieldsArgs}
}}

message {name24}Include {{{includeArgs}
}}

message {name25} {{
  int32 id = 1;{modelArgs}
}}

message FetchOne{name26}Request {{
  int32 id = 1;
  optional {name27}Include include = 2;
  string token = 3;
}}

message CreateOne{name28}Request {{{createArgs}
}}

message Update{name29} {{{updateArgs}
}}

message UpdateBulk{name30}Request {{
  Update{name31} data = 1;
  string token = 2;
  optional {name32}Where where = 3;
}}

message UpdateBulk{name33}Response {{
  int32 count = 1;
}}

message UpdateOne{name34}Request {{
  int32 id = 1;
  string token = 2;
  Update{name35} data = 3;
}}

message DeleteBulk{name36}Request {{
  {name37}Where where = 1;
  string token = 2;
}}

message DeleteBulk{name38}Response {{
  int32 count = 1;
}}

message Delete{name39}Request {{
  int32 id = 1;
  string token = 2;
}}

message Delete{name40}Response {{
  bool deleted = 1;
}}
        ]], {
                packageName = i(1),
                name1 = i(2),
                name2 = r(2),
                name3 = r(2),
                name4 = r(2),
                name5 = r(2),
                name6 = r(2),
                name7 = r(2),
                name8 = r(2),
                name9 = r(2),
                name10 = r(2),
                name11 = r(2),
                name12 = r(2),
                name13 = r(2),
                name14 = r(2),
                name15 = r(2),
                name16 = r(2),
                name17 = r(2),
                name18 = r(2),
                name19 = r(2),
                name20 = r(2),
                name21 = r(2),
                name22 = r(2),
                name23 = r(2),
                name24 = r(2),
                name25 = r(2),
                name26 = r(2),
                name27 = r(2),
                name28 = r(2),
                name29 = r(2),
                name30 = r(2),
                name31 = r(2),
                name32 = r(2),
                name33 = r(2),
                name34 = r(2),
                name35 = r(2),
                name36 = r(2),
                name37 = r(2),
                name38 = r(2),
                name39 = r(2),
                name40 = r(2),
                whereArgs = d(3, rec_where, {}),
                fieldsArgs = d(4, rec_fields, {}),
                includeArgs = d(5, rec_include, {}),
                modelArgs = d(6, rec_model, {}),
                createArgs = d(7, rec_model, {}),
                updateArgs = d(8, rec_where, {}),
        })
    ),
}
