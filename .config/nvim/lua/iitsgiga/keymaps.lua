vim.g.mapleader = " "

-- convenience
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center cursor when scrolling down half page
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center cursor when scrolling up half page
vim.keymap.set("x", "p", "\"_dP") -- don't copy on paste
vim.keymap.set("v", "Y", "\"+y") -- yank into system clipboard

-- move selection up/down
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("i", "<C-k>", "<ESC>:m .-2<CR>==gi")
vim.keymap.set("i", "<C-j>", "<ESC>:m .+1<CR>==gi")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

