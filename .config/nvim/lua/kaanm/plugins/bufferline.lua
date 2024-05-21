return {
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = {
			options = {
				numbers = function(opts)
					return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "",
						padding = 0,
						text_align = "center",
						highlight = "Offset",
					},
				},
				close_command = function(n)
					require("mini.bufremove").delete(n, false)
				end,
				right_mouse_command = function(n)
					require("mini.bufremove").delete(n, false)
				end,
				always_show_bufferline = false,
			},
		},
		config = function(_, opts)
			opts.options.groups = {
				items = {
					require("bufferline.groups").builtin.pinned:with({ icon = "" }),
				},
			}
			require("bufferline").setup(opts)
			vim.keymap.set("n", "<leader>b1", "<cmd> BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
			vim.keymap.set("n", "<leader>b2", "<cmd> BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
			vim.keymap.set("n", "<leader>b3", "<cmd> BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
			vim.keymap.set("n", "<leader>b4", "<cmd> BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
			vim.keymap.set("n", "<leader>b5", "<cmd> BufferLineGoToBuffer 5<cr>", { desc = "Go to buffer 5" })
			vim.keymap.set("n", "<leader>b6", "<cmd> BufferLineGoToBuffer 6<cr>", { desc = "Go to buffer 6" })
			vim.keymap.set("n", "<leader>b7", "<cmd> BufferLineGoToBuffer 7<cr>", { desc = "Go to buffer 7" })
			vim.keymap.set("n", "<leader>b8", "<cmd> BufferLineGoToBuffer 8<cr>", { desc = "Go to buffer 8" })
			vim.keymap.set("n", "<leader>b9", "<cmd> BufferLineGoToBuffer 9<cr>", { desc = "Go to buffer 9" })
			vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Go to other buffer" })
			vim.keymap.set("n", "<leader>bn", "<cmd> BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
			vim.keymap.set("n", "<leader>bp", "<cmd> BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
			vim.keymap.set("n", "<leader>bw", "<cmd> BufferLinePick<cr>", { desc = "Pick buffer" })
			vim.keymap.set("n", "<leader>bt", "<cmd> BufferLineTogglePin<cr>", { desc = "Pin buffer" })
			vim.keymap.set(
				"n",
				"<leader>bcr",
				"<cmd> BufferLineCloseRight<cr>",
				{ desc = "Close all visible buffers to the right" }
			)
			vim.keymap.set(
				"n",
				"<leader>bcl",
				"<cmd> BufferLineCloseLeft<cr>",
				{ desc = "Close all visible buffers to left" }
			)
			vim.keymap.set(
				"n",
				"<leader>bct",
				"<cmd> BufferLineGroupClose ungrouped <cr>",
				{ desc = "Close ungrouped buffers" }
			)
			-- Fix bufferline when restoring a session
		end,
	},
}
