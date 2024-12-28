return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup()

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
