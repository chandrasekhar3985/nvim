return {
	"asiryk/auto-hlsearch.nvim",
	tag = "1.1.0",

	config = function()
		require("auto-hlsearch").setup({
			remap_keys = { "/", "?", "*", "#", "n", "N" },
			create_commands = true,
			pre_hook = function() end,
			post_hook = function() end,
		})
	end,
}
