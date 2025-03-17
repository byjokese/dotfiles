return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Developer", "~/Downloads", "/" },
	},
}
