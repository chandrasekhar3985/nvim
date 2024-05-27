return {
	"aspeddro/slides.nvim",
	config = function()
		require("slides").setup({
			bin = "/usr/local/bin/slides", -- path to binary
			fullscreen = true, -- open in fullscreen
		})
	end,
}
