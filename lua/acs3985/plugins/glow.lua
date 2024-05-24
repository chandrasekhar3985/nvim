return {
	"ellisonleao/glow.nvim",
	cmd = "Glow",
	config = function()
		local glow = require("glow")

		glow.setup({

			install_path = "~/.local/bin", -- default path for installing glow binary
			border = "shadow", -- floating window border config
			style = "dark", -- filled automatically with your current editor background, you can override using glow json style
			pager = false,
			width = 120,
			height = 140,
			width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
			height_ratio = 0.7,
		})
	end,
}
