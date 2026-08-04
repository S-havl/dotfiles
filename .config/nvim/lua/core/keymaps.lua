vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir a ventana izquierda" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir a ventana inferior" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir a ventana superior" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir a ventana derecha" })

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir/Cerrar Explorador" })

keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Siguiente pestaña" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Pestaña anterior" })
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Cerrar pestaña actual" })
