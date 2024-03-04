vim.g.mapleader = " "
--exit file
vim.keymap.set("n","<leader><esc>",":Neotree<CR>")
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

vim.keymap.set("n","<leader>h","<C-w>h")
vim.keymap.set("n","<leader>j","<C-w>j")
vim.keymap.set("n","<leader>k","<C-w>k")
vim.keymap.set("n","<leader>l","<C-w>l")
vim.keymap.set("n","<leader>q","<C-w>c")

vim.keymap.set("n","<leader>1",":BufferGoto 1<CR>")
vim.keymap.set("n","<leader>2",":BufferGoto 2<CR>")
vim.keymap.set("n","<leader>3",":BufferGoto 3<CR>")
vim.keymap.set("n","<leader>4",":BufferGoto 4<CR>")
vim.keymap.set("n","<leader>5",":BufferGoto 5<CR>")
vim.keymap.set("n","<leader>6",":BufferGoto 6<CR>")
vim.keymap.set("n","<leader>7",":BufferGoto 7<CR>")
vim.keymap.set("n","<leader>8",":BufferGoto 8<CR>")
vim.keymap.set("n","<leader>9",":BufferGoto 9<CR>")
vim.keymap.set("n","<leader>0",":BufferLast<CR>")
--vim.keymap.set("n","<leader>p",":BufferPin<CR>")
vim.keymap.set("n","<leader>c",":BufferClose<CR>")

--undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--telescope
--[[
local tele = require("telescope.builtin")
vim.keymap.set("n", "<leader>Ff", tele.find_files, {})
vim.keymap.set("n", "<leader>Fg", tele.live_grep, {})
vim.keymap.set("n", "<leader>Fb", tele.buffers, {})
vim.keymap.set("n", "<leader>Fh", tele.help_tags, {})
]]
