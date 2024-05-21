-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Go to beginning of line
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Go to the beginning of line" })

-- Go to end of line
keymap.set("i", "<C-e>", "<End>", { desc = "Go to the end of line" })

-- Save file
keymap.set("i", "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<M-Up>", ":resize +2<cr>", { desc = "Resize window up" })
keymap.set("n", "<M-Down>", ":resize -2<cr>", { desc = "Resize window down" })
keymap.set("n", "<M-Left>", ":vertical resize +2<cr>", { desc = "Resize window left" })
keymap.set("n", "<M-Right>", ":vertical resize -2<cr>", { desc = "Resize window right" })

-- Quit
keymap.set("n", "<leader>qa", "<cmd> qall <cr>", { desc = "Quit all" })
keymap.set("n", "<leader>qA", "<cmd> qall! <cr>", { desc = "Quit force all" })
keymap.set("n", "<leader>qq", "<cmd> q <cr>", { desc = "Quit window" })
keymap.set("n", "<leader>qQ", "<cmd> q! <cr>", { desc = "Quit force window" })

-- Save
keymap.set("n", "<leader>qs", "<cmd> w <cr>", { desc = "Save" })
keymap.set("n", "<leader>qS", "<cmd> wa <cr>", { desc = "Save all" })

-- Toggle line numbers
keymap.set("n", "<leader>tr", "<cmd> set rnu! <cr>", { desc = "Toggle relative line numbers" })
