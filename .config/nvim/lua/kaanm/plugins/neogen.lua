return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
	vim.keymap.set("n", "<leader>cg", function()
		require("neogen").generate()
	end, { desc = "Generate annotation" }),
}
