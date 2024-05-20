-----defining all shortcuts-------
local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local extras = require("luasnip.extras")
local rep = extras.rep
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
-------end-------------------
--Defineing Functions---------

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual ---for visual mode
-------------end--------------------

--------- New line Condition-----------------------
--- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- ...then add `condition=line_begin` to any snippet's `opts` table:
-- ---------end--------------------------------
ls.add_snippets("markdown", {
	s({ trig = "h1", snippetType = "autosnippet" }, fmta([[# <> ]], { i(1) }), { condition = line_begin }),
	s({ trig = "h2", snippetType = "autosnippet" }, fmta([[## <> ]], { i(1) }), { condition = line_begin }),
	s({ trig = "h3", snippetType = "autosnippet" }, fmta([[### <> ]], { i(1) }), { condition = line_begin }),
	s({ trig = "h4", snippetType = "autosnippet" }, fmta([[#### <> ]], { i(1) }), { condition = line_begin }),
})

-----------------textediting--------------------
ls.add_snippets("markdown", {
	s({ trig = ".bo", dscr = "bold", snippetType = "autosnippet" }, fmta([[ <>**<>** ]], { i(1), d(1, get_visual) })),
	s({ trig = ".it", dscr = "italic", snippetType = "autosnippet" }, fmta([[ <>_<>_ ]], { i(1), d(1, get_visual) })),
	s(
		{ trig = ".bt", dscr = "bold and italic", snippetType = "autosnippet" },
		fmta([[ <>**_<>_** ]], { i(1), d(1, get_visual) })
	),
	s(
		{ trig = ".ma", dscr = "Highlighting text", snippetType = "autosnippet" },
		fmt([[ {}<mark>{}</mark>  ]], { i(1), d(1, get_visual) })
	),
	s(
		{ trig = ".un", dscr = "Underline text", snippetType = "autosnippet" },
		fmt([[ {}<u>{}</u>  ]], { i(1), d(1, get_visual) })
	),
	s(
		{ trig = ".st", dscr = "Strike through", snippetType = "autosnippet" },
		fmt([[ {}~~{}~~  ]], { i(1), d(1, get_visual) })
	),
	s(
		{ trig = ".ma", dscr = "Highlighting text", snippetType = "autosnippet" },
		fmt([[ {}<mark>{}</mark>  ]], { i(1), d(1, get_visual) })
	),
})

--------------------objects-------
ls.add_snippets("markdown", {
	s(
		{ trig = ".url", dscr = "url", snippetType = "autosnippet" },
		fmta([[ [<>](<>) ]], { i(1, "Name"), i(2, "url") })
	),
})
