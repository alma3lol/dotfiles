--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local math = require('math')
local lush = require('lush')
local hsl = lush.hsl
local hsluv = lush.hsluv

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal { fg = hsluv("#A3CFF5") },                             -- Normal text
    NormalFloat { fg = hsl(170, 70, 30) },                        -- Normal text in floating windows.
    NormalNC { fg = Normal.fg.da(40) },                           -- normal text in non-current windows
    Whitespace { fg = Normal.fg.da(40) },                         -- "nbsp", "space", "tab" and "trail" in 'listchars'

    ColorColumn {},                                               -- Columns set with 'colorcolumn'
    Conceal {},                                                   -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = Normal.fg.da(40) },                             -- Character under the cursor
    lCursor { Cursor },                                           -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM {},                                                  -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn {},                                              -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine {},                                                -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = hsl(200, 90, 50) },                          -- Directory names (and other special names in listings)
    DiffAdd { NormalFloat },                                      -- Diff mode: Added line |diff.txt|
    DiffChange { fg = hsl(60, 100, 50) },                         -- Diff mode: Changed line |diff.txt|
    DiffDelete { fg = hsl(0, 100, 50) },                          -- Diff mode: Deleted line |diff.txt|
    DiffText { fg = hsl(30, 100, 50) },                           -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer {},                                               -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor { bg = Whitespace.fg },                            -- Cursor in a focused terminal
    TermCursorNC { bg = TermCursor.bg.da(80) },                   -- Cursor in an unfocused terminal
    ErrorMsg { fg = hsl(0, 100, 50) },                            -- Error messages on the command line
    VertSplit {},                                                 -- Column separating vertically split windows
    Folded { fg = Normal.fg.da(20) },                             -- Line used for closed folds
    FoldColumn { fg = Normal.fg.da(70) },                         -- 'foldcolumn'
    SignColumn {},                                                -- Column where |signs| are displayed
    IncSearch { fg = hsl(0, 100, 50), bg = Normal.fg.da(70) },    -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { fg = hsl(100, 100, 50), bg = Normal.fg.da(70) }, -- |:substitute| replacement text highlighting
    LineNr { fg = Normal.fg.da(75) },                             -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { NormalNC },                                    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { bg = hsl(30, 100, 50), fg = hsl(0, 0, 100) },    -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg {},                                                   -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { fg = hsl(100, 100, 50) },                           -- Area for messages and cmdline
    MsgSeparator {},                                              -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg {},                                                   -- |more-prompt|
    NonText { NormalNC },                                         -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu { NormalNC },                                           -- Popup menu: Normal item.
    PmenuSel { fg = hsl(180, 70, 50) },                           -- Popup menu: Selected item.
    PmenuSbar { bg = NormalNC.fg },                               -- Popup menu: Scrollbar.
    PmenuThumb { bg = PmenuSel.fg },                              -- Popup menu: Thumb of the scrollbar.
    Question { NormalNC },                                        -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = NormalFloat.fg.da(30) },                  -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { fg = hsl(60, 100, 50), bg = Normal.fg.da(70) },      -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey {},                                                -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad {},                                                  -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap {},                                                  -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal {},                                                -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare {},                                                 -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { bg = Normal.fg.da(50), fg = Normal.fg.da(30) },  -- Status line of current window
    StatusLineNC { bg = NormalFloat.fg },                         -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine {},                                                   -- Tab pages line, not active tab page label
    TabLineFill {},                                               -- Tab pages line, where there are no labels
    TabLineSel {},                                                -- Tab pages line, active tab page label
    Title {},                                                     -- Titles for output from ":set all", ":autocmd" etc.
    Visual { bg = Normal.fg.da(60) },                             -- Visual mode selection
    VisualNOS {},                                                 -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = hsl(30, 100, 50) },                         -- Warning messages
    Winseparator { fg = Normal.fg.da(25) },                       -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu {},                                                  -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = hsl(math.random(0, 360), 90, 80) },
    Constant { fg = hsl(360, 50, 50) },                  -- (*) Any constant
    String { fg = hsl(90, 90, 50) },                     --   A string constant: "this is a string"
    Character { bg = Normal.fg.da(70) },                 --   A character constant: 'c', '\n'
    Number { fg = hsl(180, 50, 50) },                    --   A number constant: 234, 0xff
    Boolean { fg = hsl(200, 100, 50) },                  --   A boolean constant: TRUE, false
    Float { Number },                                    --   A floating point constant: 2.3e10

    Identifier { Normal },                               -- (*) Any variable name
    Function { fg = hsl(30, 100, 50) },                  --   Function name (also: methods for classes)

    Statement { Function },                              -- (*) Any statement
    Conditional { Function },                            --   if, then, else, endif, switch, etc.
    Repeat { Boolean },                                  --   for, do, while, etc.
    Label { Comment },                                   --   case, default, etc.
    Operator { fg = Function.fg.da(30) },                --   "sizeof", "+", "*", etc.
    Keyword { fg = hsl(260, 50, 50) },                   --   any other keyword
    Exception { Function },                              --   try, catch, throw

    PreProc {},                                          -- (*) Generic Preprocessor
    Include {},                                          --   Preprocessor #include
    Define {},                                           --   Preprocessor #define
    Macro {},                                            --   Same as Define
    PreCondit {},                                        --   Preprocessor #if, #else, #endif, etc.

    Type { NormalNC },                                   -- (*) int, long, char, etc.
    StorageClass { Type },                               --   static, register, volatile, etc.
    Structure { Type },                                  --   struct, union, enum, etc.
    Typedef { Type },                                    --   A typedef

    Special { Keyword },                                 -- (*) Any special symbol
    SpecialChar {},                                      --   Special character in a constant
    Tag {},                                              --   You can use CTRL-] on this
    Delimiter { fg = hsl(30, 100, 50) },                 --   Character that needs attention
    SpecialComment { String },                           --   Special things inside a comment (e.g. '\n')
    Debug { Constant },                                  --   Debugging statements

    Underlined { gui = "underline" },                    -- Text that stands out, HTML links
    Ignore { fg = Normal.fg.da(80) },                    -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { fg = hsl(0, 100, 50) },                      -- Any erroneous construct
    Todo { bg = hsl(200, 75, 50), fg = hsl(0, 0, 100) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText {},            -- Used for highlighting "text" references
    LspReferenceRead {},            -- Used for highlighting "read" references
    LspReferenceWrite {},           -- Used for highlighting "write" references
    LspCodeLens {},                 -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator {},        -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter {}, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError {},                          -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn {},                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo {},                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint {},                           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError {},               -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn {},                -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo {},                -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint {},                -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError {},                 -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn {},                  -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo {},                  -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint {},                  -- Used to underline "Hint" diagnostics.
    DiagnosticFloatingError { DiagnosticError }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn { DiagnosticWarn },   -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo { DiagnosticInfo },   -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint { DiagnosticHint },   -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError { DiagnosticError },     -- Used for "Error" signs in sign column.
    DiagnosticSignWarn { DiagnosticWarn },       -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo { DiagnosticInfo },       -- Used for "Info" signs in sign column.
    DiagnosticSignHint { DiagnosticHint },       -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym "@text.literal" { String },           -- Comment
    sym "@text.reference" {},                 -- Identifier
    sym "@text.title" {},                     -- Title
    sym "@text.uri" {},                       -- Underlined
    sym "@text.underline" { Underlined },     -- Underlined
    sym "@text.todo" {},                      -- Todo
    sym "@comment" { Comment },               -- Comment
    sym "@punctuation" { Delimiter },         -- Delimiter
    sym "@constant" { Constant },             -- Constant
    sym "@constant.builtin" {},               -- Special
    sym "@constant.macro" {},                 -- Define
    sym "@define" {},                         -- Define
    sym "@macro" {},                          -- Macro
    sym "@string" { String },                 -- String
    sym "@string.escape" {},                  -- SpecialChar
    sym "@string.special" { SpecialChar },    -- SpecialChar
    sym "@character" { Character },           -- Character
    sym "@character.special" { SpecialChar }, -- SpecialChar
    sym "@number" { Number },                 -- Number
    sym "@boolean" { Boolean },               -- Boolean
    sym "@float" { Float },                   -- Float
    sym "@function" { Function },             -- Function
    sym "@function.builtin" {},               -- Special
    sym "@function.macro" {},                 -- Macro
    sym "@parameter" {},                      -- Identifier
    sym "@method" {},                         -- Function
    sym "@field" {},                          -- Identifier
    sym "@property" {},                       -- Identifier
    sym "@constructor" {},                    -- Special
    sym "@conditional" { Conditional },       -- Conditional
    sym "@repeat" { Repeat },                 -- Repeat
    sym "@label" { Label },                   -- Label
    sym "@operator" { Operator },             -- Operator
    sym "@keyword" { Keyword },               -- Keyword
    sym "@symbol" { Keyword },                -- Symbol
    sym "@exception" { Exception },           -- Exception
    sym "@variable" { fg = hsl(0, 0, 100) },  -- Identifier
    sym "@type" {},                           -- Type
    sym "@type.definition" {},                -- Typedef
    sym "@storageclass" {},                   -- StorageClass
    sym "@structure" { Structure },           -- Structure
    sym "@namespace" {},                      -- Identifier
    sym "@include" { Include },               -- Include
    sym "@preproc" { PreProc },               -- PreProc
    sym "@debug" { Debug },                   -- Debug
    sym "@tag" { Tag },                       -- Tag

    ------------------------------
    -- BufferLine:
    ------------------------------

    BufferLineBackground { NormalNC },
    BufferLineBuffer { NormalNC },
    BufferLineBufferSelected { NormalFloat, gui = "bold,italic" },
    BufferLineBufferVisible { NormalNC },
    BufferLineCloseButton { fg = Normal.fg.da(70) },
    BufferLineCloseButtonSelected {},
    BufferLineCloseButtonVisible {},
    BufferLineDevIconLua {},
    BufferLineDevIconLuaInactive {},
    BufferLineDevIconLuaSelected {},
    BufferLineDevIconVim {},
    BufferLineDevIconVimInactive {},
    BufferLineDevIconVimSelected {},
    BufferLineDiagnostic {},
    BufferLineDiagnosticSelected {},
    BufferLineDiagnosticVisible {},
    BufferLineDuplicate {},
    BufferLineDuplicateSelected {},
    BufferLineDuplicateVisible {},
    BufferLineError { BufferLineBackground },
    BufferLineErrorDiagnostic { fg = hsl(360, 70, 50) },
    BufferLineErrorDiagnosticSelected { BufferLineErrorDiagnostic },
    BufferLineErrorDiagnosticVisible { BufferLineErrorDiagnostic },
    BufferLineErrorSelected { BufferLineBuffer, gui = "bold,italic" },
    BufferLineErrorVisible { BufferLineErrorDiagnostic },
    BufferLineFill {},
    BufferLineGroupLabel { bg = NormalNC.fg.da(70), fg = Normal.fg.da(30) },
    BufferLineGroupSeparator { NormalFloat },
    BufferLineHint { BufferLineBuffer },
    BufferLineHintDiagnostic { fg = hsl(200, 75, 50) },
    BufferLineHintDiagnosticSelected { BufferLineHintDiagnostic },
    BufferLineHintDiagnosticVisible { BufferLineHintDiagnostic },
    BufferLineHintSelected { BufferLineBufferSelected, gui = "bold,italic" },
    BufferLineHintVisible { BufferLineHintDiagnostic },
    BufferLineIndicatorSelected {},
    BufferLineIndicatorVisible {},
    BufferLineInfo { BufferLineBuffer },
    BufferLineInfoDiagnostic { fg = hsl(200, 75, 50) },
    BufferLineInfoDiagnosticSelected { BufferLineInfoDiagnostic },
    BufferLineInfoDiagnosticVisible { BufferLineInfoDiagnostic },
    BufferLineInfoSelected { BufferLineBufferSelected, gui = "bold,italic" },
    BufferLineInfoVisible { BufferLineInfoDiagnostic },
    BufferLineModified { fg = hsl(30, 100, 50) },
    BufferLineModifiedSelected { BufferLineModified },
    BufferLineModifiedVisible { BufferLineModified },
    BufferLineNumbers { fg = hsl(210, 100, 50) },
    BufferLineNumbersSelected { LineNr },
    BufferLineNumbersVisible {},
    BufferLineOffsetSeparator {},
    BufferLinePick {},
    BufferLinePickSelected { fg = hsl(0, 0, 50) },
    BufferLinePickVisible {},
    BufferLineSeparator { fg = hsluv("#000000") },
    BufferLineSeparatorSelected {},
    BufferLineSeparatorVisible {},
    BufferLineTab {},
    BufferLineTabClose {},
    BufferLineTabSelected {},
    BufferLineTabSeparator {},
    BufferLineTabSeparatorSelected {},
    BufferLineWarning { BufferLineBuffer },
    BufferLineWarningDiagnostic { fg = hsl(30, 100, 50) },
    BufferLineWarningDiagnosticSelected { BufferLineWarningDiagnostic },
    BufferLineWarningDiagnosticVisible { BufferLineWarningDiagnostic },
    BufferLineWarningSelected { BufferLineBufferSelected, gui = "bold,italic" },
    BufferLineWarningVisible { BufferLineWarningDiagnostic },

    ------------------------
    -- Notify:
    ------------------------
    NotifyBackground { bg = hsluv("#000000") }

  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
