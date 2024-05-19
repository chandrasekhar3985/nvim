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
----------Snippets for latex-------------
---------Snippets for line begin---------
ls.add_snippets("tex", {
	s(
		{ trig = "cla", dscr = "documentclass", snippetType = "autosnippet" },
		fmta(
			[[ \documentclass[<>]{<>} % article, book, report, Thesis, Journal ]],
			{ i(1, "12pt, a4paper"), i(2, "artile") }
		),
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
	s(
		{ trig = "bg", dscr = "A generic new environmennt", snippetType = "autosnippet" },
		fmta(
			[[
     \begin{<>}
         <>
     \end{<>}
   ]],
			{
				i(1),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "h1", dscr = "part", snippetType = "autosnippet" },
		fmta([[<>\part{<>}% Part name of book]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "h2", dscr = "chapter", snippetType = "autosnippet" },
		fmta([[<>\chapter{<>}% Name of Chapter]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "h3", dscr = "section", snippetType = "autosnippet" },
		fmta([[<>\section{<>}% Name of Section]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "h4", dscr = "subsection", snippetType = "autosnippet" },
		fmta([[<>\subsection{<>}% Name of Subsection]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "h4", dscr = "subsubsection", snippetType = "autosnippet" },
		fmta([[<>\subsubsection{<>}% Name of subsection]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "h5", dscr = "paragraph", snippetType = "autosnippet" },
		fmta([[<>\paragraph{<>}% paragraph]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(

		{ trig = "h6", dscr = "subparagraph", snippetType = "autosnippet" },
		fmta([[<>\subparagraph{<>}]], { i(1), d(1, get_visual) }),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = "mv", dscr = "math visual mode", snippetType = "autosnippet" },
		fmta(
			[[ 
            \[
            <>
            \]
         ]],
			{ i(1, "x + y") }
		),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = ",t", dscr = "Simple title", snippetType = "autosnippet" },
		c(1, {
			fmta(
				[[ 
            \title{<>} % Name of Title
            \author{<>} % Name of Author
            \date{<>} % Leave blank  for empty date, \today for current date.
            \hrule 
          ]],
				{
					i(1, "Title"),
					i(2, "Chandrasekhar A"),
					i(3),
				}
			),
			fmta(
				[[ 
            \usepackage{authblk}
            \title{<>} % Name of Title
            \author[1]{<> \thanks{ <>}} % First author name with additional info linke mailid
            \author[2]{<>}% Second author name
            \affil[1]{<>}% Further Info wrt auth 1
            \affil[2]{<>}% Further Info wrt auth 2
            \date{<>}% leave empty for no date
        ]],
				{
					i(1, "Title"),
					i(2, "Auther Name"),
					i(3, "Mailid or phone no"),
					i(4, "Author Name"),
					i(5, "Info auth 1"),
					i(6, "Info Auth 2"),
					i(7),
				}
			),
		}),
		{ condition = line_begin } -- set condition in the `opts` table
	),
	s(
		{ trig = ".pkg", dscr = "Load nessarry packages", snippetType = "autosnippet" },
		fmta(
			[[ 
          \usepackage(amsmath, amssymb, amsfonnts)  %for mathematics
          \usepackage[mathtools] % for mathematics
          \usepackage[left=4mm, top=2mm, right=2mm, bottom=2mm]{geometry}
          \usepackage[graphicx] % for graphics
          \usepackage[xcolor] % for colors
          \usepackage{xfrac}  % Nice fractions 
          \usepackage{nicefrac} % Nice fractions
          \usepackage[labelfont=bf]{caption} % For bold font caption
          \usepackage{wrapfig} % Wrapping text around figure 
          \usepackage(subcaption) % Figure side by side
          \usepackage{multirow}% Table: multiple rows and columns
          \usepackage{array}
          \usepackage{hyperref} % Digital reference, it  can be used for name ref.
          \usepackage[labelfont=bf]{caption} % For bold font caption
          \usepackage[namelink]{cleveref} % package for referencing, put after hyperref package.
          %it provides \cref{}, \cpageref for small initial letters and \Cref and \Cref{} and \Cpageref
          % to capitalise beginning of a sentence
          \usepackage[inline]{enumitem} % for creating inline list 
          \usepackage{microtype}% improve spacing between words and letters
          \usepackage{siunitex}% writes units and  some symbols


      ]],
			{}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = ".f", dscr = "Figure Envirronment", snippetType = "autosnippet" },
		c(1, {
			fmta(
				[[  
            \begin{figure}[h!]
            \centering
            \includegraphics[scale=<>]{<>}% scale = % size of image in point.
            \caption{<>}
            \label{<>}
            \end{figure}
          ]],
				{
					i(1, "0.5"),
					i(2, "pic.png"),
					i(3, "Beautiful pic"),
					i(4, "fig: beauty"),
				}
			),
			fmta(
				[[
              \begin{wrapfigure}{<>}{<>} % first option l(left), r(right), c(center), 2nd option size
              \centering
              \includegraphics[width=<>]{<>} 
              \caption{<>}
              \label{<>}
              \end{wrapfigure}
          ]],
				{
					i(1, "l"),
					i(2, "3in"),
					i(3, "2.5in"),
					i(4, "pic.png"),
					i(5, "Beautiful Pic"),
					i(6, "fig: beauty"),
				}
			),
			fmta(
				[[  
              \begin{figure}[h!]
              \centering
              \begin{subfigure}{<>} %measurement of 1st figure
              \includegraphics[scale=<>]{<>} % scale = % size of image in point. 
              \caption{<>} % First figure caption
              \label{<>}  % first figure label 
              \end{subfigure}
              \begin{subfigure}{<>}
              \includegraphics[scale=<>]{<>} % scale = % size of image in point. 
              \caption{<>} % Second figure caption
              \label{<>} % Second Figure Label
              \end{subfigure}
              \caption{<>} % gobal caption
              \label{<>} % global label
              \end{figure}
          ]],
				{
					i(1, "0.45\\linewidth"),
					i(2, ".5"),
					i(3, "1.png"),
					i(4, "First caption"),
					i(5, "fig:1st"),
					i(6, "0.45\\linewidth"),
					i(7, ".5"),
					i(8, "2.png"),
					i(9, "Second Caption"),
					i(10, "fig:2nd"),
					i(11, "global caption"),
					i(12, "fig:global"),
				}
			),
		}),
		{ condition = line_begin }
	),
})

ls.add_snippets("tex", {
	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
	s(
		{ trig = "([^%a])ee", regTrig = true, wordTrig = false },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
})

ls.add_snippets("tex", {
	s(
		{ trig = "l11", dscr = "HUGE", snippetType = "autosnippet" },
		fmta([[<> {\HUGE <>  }]], {
			i(1),
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),
})
