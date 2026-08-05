vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open/Close Explorer" })

keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close the current tab" })
