local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

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
		"h",
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
