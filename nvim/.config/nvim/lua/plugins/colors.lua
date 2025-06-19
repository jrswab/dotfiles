return {
	"neanias/everforest-nvim",
	name = "everforest",
	version = false,
	lazy = false,
	priority = 1000, -- load this before all the other start plugins

	config = function()
		require("everforest").setup({
			-- “Calm the rainbow”
			colours_override = function(palette)
				local calm     = "#D3C6AA"

				palette.aqua   = calm
				palette.blue   = calm
				palette.purple = calm
				-- (red, yellow, orange and green stay as-is)
			end,
		})

		-- load the colorscheme
		require("everforest").load()
	end,
}
