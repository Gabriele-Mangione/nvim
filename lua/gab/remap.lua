vim.g.mapleader = " "
vim.keymap.set("n","<leader><esc>",vim.cmd.Ex)
vim.keymap.set("n","<leader>s",":w<CR>")
vim.lsp.buf.format()
vim.keymap.set("n","<leader>y","\"+y") --somehow doesn't work, maybe cause windows
vim.keymap.set("v","<leader>y","\"+y")

vim.keymap.set("n","Q", "<nop>")
