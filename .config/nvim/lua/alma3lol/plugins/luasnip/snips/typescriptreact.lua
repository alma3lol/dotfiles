local luasnip = require('luasnip')

local fmt = require "luasnip.extras.fmt".fmt
local s = luasnip.snippet
local sn = luasnip.snippet_node
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node
local c = luasnip.choice_node
local r = require "luasnip.extras".rep
-- local u = function (index)
--     return f(function(args)
--         return args[index][1]:upper()
--     end, { index })
-- end
-- local l = function (index)
--     return f(function(args)
--         return args[index][1]:lower()
--     end, { index })
-- end
--
--
-- local lowercaseFirstLetter = function (index)
--     return f(function(args)
--         return args[index][1]:sub(1,1):lower()..args[index][1]:sub(2)
--     end, { index })
-- end

local uppercaseFirstLetter = function(index)
    return f(function(args)
        return args[index][1]:sub(1, 1):upper() .. args[index][1]:sub(2)
    end, { index })
end

return {
    s('us',
        fmt([[
        const [{}, set{}] = useState{}({});
            ]], {
            i(1),
            uppercaseFirstLetter(1),
            c(2, { sn(nil, { t '<', i(1), t '>' }), t '' }),
            i(3),
        })
    ),
    s('ue',
        fmt([[
        useEffect(() => {{
            {}
        }}, [{}]);
            ]], {
            i(0),
            i(1),
        })
    ),
    s('muidialog',
        fmt([[
        <Dialog open={{{open}}} fullWidth onClose={{{onClose}}}{maxWidth}>
            <form onSubmit={{{onSubmit}}}>
                <DialogTitle>{title}</DialogTitle>
                <DialogContent>{content}</DialogContent>
                <DialogActions>
                    <Stack spacing={{1}} direction='row'>
                        <Button onClick={{{onClose1}}}>{closeText}</Button>
                        <LoadingButton variant='contained' type='submit' loading={{{loading}}}>{loadingText}</LoadingButton>
                    </Stack>
                </DialogActions>
            </form>
        </Dialog>
        ]], {
            open = i(1),
            onClose = i(2),
            onClose1 = r(2),
            maxWidth = c(3, { sn(nil, { t ' maxWidth=\'', i(1), t '\'' }), t '' }),
            onSubmit = i(4),
            title = i(5),
            content = i(0),
            closeText = i(6),
            loading = i(7),
            loadingText = i(8),
        })
    ),
}
