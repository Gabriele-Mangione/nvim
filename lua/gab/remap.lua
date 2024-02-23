vim.g.mapleader = " "
--exit file
vim.keymap.set("n","<leader><esc>",vim.cmd.Ex)
--save file
vim.keymap.set("n","<leader>s",":w<CR>")
vim.lsp.buf.format()
--copy into clipboard
vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("v","<leader>y","\"+y")

--remove "Q" operator
vim.keymap.set("n","Q", "<nop>")
--format file
vim.keymap.set("n","<leader>f", vim.lsp.buf.format)
