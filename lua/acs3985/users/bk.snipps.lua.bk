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
---------------- examples for learning-----------------
ls.add_snippets("lua", {

	s("l", t("its working")),
})

ls.add_snippets("lua", { -- language, file type declaration.
	s("var", { -- snip word declaration
		t("local "), -- text mode declaration
		i(1, "name"), -- insert mode declaration
		t(" = "),
		i(2, "'value'"), -- 'value' : default value declaration
		i(0), -- croth jump place
	}),
})

ls.add_snippets("lua", {
	s(
		"vt",
		fmt("local {} = {}", { -- use of fmt
			i(1),
			i(2),
		})
	),
})

ls.add_snippets("lua", { -- use of choice node
	s(
		"k",
		c(1, {
			fmt("local {} = {}", {
				i(1, "value"),
				i(2, "text"),
			}),
			fmt("{} = {}", {
				i(1, "value"),
				i(2, "text"),
			}),
		})
	),
})
-- use of function node
ls.add_snippets("lua", {
	s(
		"ii",
		f(function()
			return os.date("%Y-%m-%d")
		end)
	),
})

-- use of dependencies function node
ls.add_snippets("lua", {
	s(
		"tt",
		fmt('local  {} = require( "{}")', {
			f(function(values)
				vim.print(values)
				return "name"
			end, 1), -- this value depands on insert node
			i(1), -- insert node
		})
	),
})
-- use dependencies
ls.add_snippets("lua", {
	s(
		"ll",
		fmt('local {} = require("{}")', {
			f(function(values)
				local value = values[1][1]
				local path = vim.split(value, "%.")
				return path[#path]
			end, { 1 }),
			i(1),
		})
	),
})

-----------end examples-----------
-----------new examples for further learning----------
-- ------------autotrigger---------------
ls.add_snippets("tex", { -- filetype declaration
	-- Example How to set snippet parameters.
	s(
		{ -- Table 1: snippet parameters
			trig = "hi",
			dscr = "event",
			regTrig = false,
			priority = 1000,
			snippetType = "autosnippet",
		},
		{ -- Table 2 : snippet nodes
			t("Hello, World"),
		}
		-- Table 3: The advanced snippet options, left blank.
	),
})

-----Snippets for Latex-----

---Snippets for letters---------
-- Note that you have to escape the backslash character
-- to insert it literally—for example I have to write t("\\alpha")
-- to produce the string \alpha in the first snippet.
ls.add_snippets("tex", {
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}),
})

--- Combination for insert and textnodes for few boiler plates ---

ls.add_snippets("tex", {
	s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}' " }, {
		t("\\texttt{"), -- remember : backslash need to be escaped.
		i(1, "text"), -- 1 for dynamic node value, text is default value.
		t("}"),
	}),
	-- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
	-- there is a much better, human-readable solution: ls.fmt, described shortly.
	s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}' " }, {
		t("\\frac{"), -- remember : backslash need to be escaped.
		i(1, "x"), -- 1 for dynamic node value, text is default value.
		t("}"),
		t("{"),
		i(2, "y"),
		t("}"),
		i(0), -- final position of curser after done with snippets.
	}),
})

-- Format: a human-friendly syntax for writing snippets

ls.add_snippets("tex", {
	-- The same equation snippet, using LuaSnip's fmt function.
	-- The snippet is not shorter, but it is more *human-readable*.
	s(
		{ trig = "eq", dscr = "A LaTeX equation environment" },
		fmt( -- The snippet code actually looks like the equation environment it produces.
			[[
      \begin{equation}
          <>
      \end{equation}
    ]],
			-- The insert node is placed in the <> angle brackets
			{ i(1, "a + b = c") },
			-- This is where I specify that angle brackets are used as node positions.
			{ delimiters = "<>" }
		)
	),
})

--- using fmta table---
ls.add_snippets("tex", {
	s(
		{ trig = "cen", dscr = "A latex Center Environment" },
		fmta(
			[[
       \begin{center}
           <>
       \end{center}
     ]],
			{ i(1, "Your Text") }
		)
	),
})
--- Repeated nodes
ls.add_snippets("tex", {
	s(
		{ trig = "beg", dscr = "Begin and End Latex Environment" },
		fmta(
			[[
        \begin{<>}
          <>
        \end{<>}
      ]],
			{
				i(1, "document"),
				i(2),
				rep(1), -- this node repeats insert node i(1)
			}
		)
	),
})
-- Custom snippet exit point with the zeroth insert node
ls.add_snippets("tex", {
	s(
		{ trig = "eq1", dscr = " equation environment" },
		fmta(
			[[
        \begin{equation}
          <>
        \end{equation}
      ]],
			{
				i(0),
			}
		)
	),
})

-- Insert node placeholder text
ls.add_snippets("tex", {
	s(
		{ trig = "hr", dscr = "latex hr command" },
		fmta([[\href{<>}{<>}]], {
			i(1, "url"),
			i(2, "display name"),
		})
	),
})

-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

-------------------------------------------
ls.add_snippets("tex", {
	-- Example: italic font implementing visual selection
	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),
})

--Regex snippet triggers---
