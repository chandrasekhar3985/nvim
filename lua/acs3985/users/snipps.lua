------defining all shortcuts-------
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

-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env("tikzpicture")
end

----------------------end--------------------------

--------- New line Condition-----------------------
--- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- ...then add `condition=line_begin` to any snippet's `opts` table:
-- ---------end--------------------------------
--Snippets that should be accessible globally (in all filetypes) have to be added to the special filetype all.

ls.add_snippets("all", {
	s({
		trig = "prasad",
		dscr = "Full Name Chandrasekhar",
		regTrig = false,
		wordTrig = true,
		snippetType = "autosnippet",
		priority = 1000,
	}, {
		t("Chandrasekhar Anabatula"),
	}),
})

ls.add_snippets("tex", {
	s(
		{ trig = "cla", dscr = "documentclass", snippetType = "autosnippet" },
		fmta([[ \documentclass[<>]{<>} ]], { i(1, "12pt, a4paper"), i(2, "artile") }),
		{ condition = line_begin }
	),
	s(
		{ trig = "pkg", dscr = "usepackage", snippetType = "snippet" },
		c(1, {
			fmta([[ \usepackage{<>} ]], { i(1, "geometry") }),
			fmta([[ \usepackage[<>]{<>} ]], { i(1), i(2, "geometry") }),
		}),
		{ condition = line_begin }
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
