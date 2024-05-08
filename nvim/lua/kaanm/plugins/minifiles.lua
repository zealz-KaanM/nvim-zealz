return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.files").setup({})
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ef", "<cmd>lua MiniFiles.refresh()<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
