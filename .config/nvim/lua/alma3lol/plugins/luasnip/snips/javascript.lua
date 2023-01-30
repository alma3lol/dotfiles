local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local fmt = require"luasnip.extras.fmt".fmt
local s = luasnip.snippet
local i = luasnip.insert_node
local r = require"luasnip.extras".rep

return {
    s('rtqconfig',
        fmt([[
/** @type {{import("@rtk-query/codegen-openapi").ConfigFile}} */
const config = {{
	schemaFile: '{url}/openapi.json',
	apiFile: './src/store/{rootApiFile}.ts',
	apiImport: '{rootApiImport}',
	outputFile: './src/store/{apiName}.ts',
	exportName: '{apiName1}',
	hooks: true,
}}

module.exports = config
        ]], {
            url = i(1, 'http://127.0.0.1:4000/explorer'),
                rootApiFile = i(2),
                rootApiImport = i(3),
                apiName = i(4),
                apiName1 = r(4),
        })
    ),
}
