require("preocts.util")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Keep the cursor in the middle of the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

-- Use the system register for yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>f", RunFormatCommand)

-- Shift indents
-- vim.keymap.set("n", "<C-]>", ">>")
-- vim.keymap.set("v", "<C-]>", ">>")
-- vim.keymap.set("n", "<C-[>", "<<")
-- vim.keymap.set("v", "<C-[>", "<<")
