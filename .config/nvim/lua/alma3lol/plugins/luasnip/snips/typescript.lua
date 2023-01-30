local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local fmt = require"luasnip.extras.fmt".fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node
local c = luasnip.choice_node
local r = require"luasnip.extras".rep
local u = function (index)
    return f(function(args)
        return args[index][1]:upper()
    end, { index })
end
local l = function (index)
    return f(function(args)
        return args[index][1]:lower()
    end, { index })
end


local lowercaseFirstLetter = function (index)
    return f(function(args)
        return args[index][1]:sub(1,1):lower()..args[index][1]:sub(2)
    end, { index })
end

-- local uppercaseFirstLetter = function (index)
--     return f(function(args)
--         return args[index][1]:sub(1,1):upper()..args[index][1]:sub(2)
--     end, { index })
-- end

return {
    s('type', {
        t('export type '), i(1, ''), t({' = {' , '    '}), i(0, ''), t({'', '}'}),
    }),
    s('tp', {
        i(1, ''), t(': '), c(2, {t 'string', t 'number', t 'boolean'}), t(';'), i(0)
    }),
    s('athunk',
        fmt([[
                export const {}Thunk = createAsyncThunk(
                  '{}/{}',
                  async ({}) => {{
                    {}
                  }}
                );
            ]], {
                i(1),
                i(2),
                r(1),
                i(3),
                i(4),
            })
    ),
    s('rtqapi',
        fmt([[
import {{ createApi }} from '@reduxjs/toolkit/query/react';
import {{ {modelName}sModel }} from "../models";
import {{ baseQuery, Count, Filter, FilterExcludingWhere, parseUri, Where }} from "./base.service";

export const {modelName1}sAPI = createApi({{
  reducerPath: '{modelName2}s',
  tagTypes: ['{modelName36}s'],
  baseQuery,
  endpoints: builder => ({{
    {modelName3}sCreate: builder.mutation<{modelName4}sModel, {{ data: Omit<{modelName5}sModel, 'id'>, pathParams?: {{ [key: string]: {idType} }} }}>({{
      query: ({{ data, pathParams }}) => ({{
        url: parseUri(`/{modelName6}s`, pathParams),
        method: 'POST',
        body: data,
      }}),
      invalidatesTags: ['{modelName37}s'],
    }}),
    {modelName7}sFetch: builder.query<{modelName8}sModel, {{ id: {idType1}, filter?: FilterExcludingWhere<{modelName9}sModel>, pathParams?: {{ [key: string]: {idType2} }} }}>({{
      query: ({{ id, filter, pathParams }}) => parseUri(`/{modelName10}s?/${{id}}filter=${{JSON.stringify(filter || {{}})}}`, pathParams),
      providesTags: ['{modelName38}s'],
    }}),
    {modelName11}sFetchAll: builder.query<{modelName12}sModel[], {{ filter?: Filter<{modelName13}sModel>, pathParams?: {{ [key: string]: {idType3} }} }}>({{
      query: ({{ filter, pathParams }}) => parseUri(`/{modelName14}s?filter=${{JSON.stringify(filter || {{}})}}`, pathParams),
      providesTags: ['{modelName39}s'],
    }}),
    {modelName15}sDelete: builder.mutation<void, {{ id: {idType4}, pathParams?: {{ [key: string]: {idType5} }} }}>({{
      query: ({{ id, pathParams }}) => ({{
        url: parseUri(`/{modelName16}s/${{id}}`, pathParams),
        method: 'DELETE'
      }}),
      invalidatesTags: ['{modelName40}s'],
    }}),
    {modelName17}sBulkDelete: builder.mutation<Count, {{ where?: Where<{modelName18}sModel>, pathParams?: {{ [key: string]: {idType6} }} }}>({{
      query: ({{ where, pathParams }}) => ({{
        url: parseUri(`/{modelName19}s?where=${{JSON.stringify(where || {{}})}}`, pathParams),
        method: 'DELETE'
      }}),
      invalidatesTags: ['{modelName41}s'],
    }}),
    {modelName20}sUpdate: builder.mutation<{modelName21}sModel, {{ id: {idType7}, data: Partial<Omit<{modelName22}sModel, 'id'>>, pathParams?: {{ [key: string]: {idType8} }} }}>({{
      query: ({{ id, data, pathParams }}) => ({{
        url: parseUri(`/{modelName23}s/${{id}}`, pathParams),
        method: 'PATCH',
        body: data,
      }}),
      invalidatesTags: ['{modelName42}s'],
    }}),
    {modelName24}sBulkUpdate: builder.mutation<Count, {{ data: Partial<Omit<{modelName25}sModel, 'id'>>, where?: Where<{modelName26}sModel>, pathParams?: {{ [key: string]: {idType9} }} }}>({{
      query: ({{ data, where, pathParams }}) => ({{
        url: parseUri(`/{modelName27}s?where=${{JSON.stringify(where || {{}})}}`, pathParams),
        method: 'PATCH',
        body: data,
      }}),
      invalidatesTags: ['{modelName43}s'],
    }}),
  }}),
}});

export const {{
  use{modelName28}sFetchQuery,
  use{modelName29}sFetchAllQuery,
  use{modelName30}sCreateMutation,
  use{modelName31}sDeleteMutation,
  use{modelName32}sBulkDeleteMutation,
  use{modelName33}sUpdateMutation,
  use{modelName34}sBulkUpdateMutation,
}} = {modelName35}sAPI;
        ]], {
                modelName = i(1), -- IMPORTS
                modelName1 = lowercaseFirstLetter(1), -- CREATE API
                modelName2 = lowercaseFirstLetter(1), -- REDUCER PATH
                modelName3 = lowercaseFirstLetter(1), -- CREATE MUTATION
                modelName4 = r(1),
                modelName5 = r(1),
                idType = c(2, { t 'number', t 'string' }),
                modelName6 = l(1),
                modelName7 = lowercaseFirstLetter(1), -- FETCH QUERY
                modelName8 = r(1),
                idType1 = r(2),
                modelName9 = r(1),
                idType2 = r(2),
                modelName10 = l(1),
                modelName11 = lowercaseFirstLetter(1), -- FETCH ALL QUERY
                modelName12 = r(1),
                modelName13 = r(1),
                idType3 = r(2),
                modelName14 = l(1),
                modelName15 = lowercaseFirstLetter(1), -- DELETE MUTATION
                idType4 = r(2),
                idType5 = r(2),
                modelName16 = l(1),
                modelName17 = lowercaseFirstLetter(1), -- BULK DELETE MUTATION
                modelName18 = r(1),
                idType6 = r(2),
                modelName19 = l(1),
                modelName20 = lowercaseFirstLetter(1), -- UPDATE MUTATION
                modelName21 = r(1),
                idType7 = r(2),
                modelName22 = r(1),
                idType8 = r(2),
                modelName23 = l(1),
                modelName24 = lowercaseFirstLetter(1), -- BULK UPDATE MUTATION
                modelName25 = r(1),
                modelName26 = r(1),
                idType9 = r(2),
                modelName27 = l(1),
                modelName28 = r(1), -- EXPORTS
                modelName29 = r(1),
                modelName30 = r(1),
                modelName31 = r(1),
                modelName32 = r(1),
                modelName33 = r(1),
                modelName34 = r(1),
                modelName35 = lowercaseFirstLetter(1),
                modelName36 = lowercaseFirstLetter(1),
                modelName37 = lowercaseFirstLetter(1),
                modelName38 = lowercaseFirstLetter(1),
                modelName39 = lowercaseFirstLetter(1),
                modelName40 = lowercaseFirstLetter(1),
                modelName41 = lowercaseFirstLetter(1),
                modelName42 = lowercaseFirstLetter(1),
                modelName43 = lowercaseFirstLetter(1),
            })
    ),
}
