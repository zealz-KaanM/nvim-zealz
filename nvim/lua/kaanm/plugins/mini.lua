return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = true,
			},
			windows = {
				preview = true,
			},
		})
		require("mini.surround").setup()
		require("mini.bufremove").setup()
		require("mini.move").setup()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.splitjoin").setup()

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ef", "<cmd>lua MiniFiles.refresh()<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
					vim.cmd(direction .. " split")
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "gs", "belowright horizontal")
				map_split(buf_id, "gv", "belowright vertical")
			end,
		})
	end,
}
