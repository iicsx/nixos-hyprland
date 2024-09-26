vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>S", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>ff", "<Cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<leader><tab>", ":quit<CR>")

vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>b", ":bprevious<CR>")
vim.keymap.set("n", "<leader>t", ":enew<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

vim.keymap.set('i', ')', [[<C-R>=strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"<CR>]], {expr = true, noremap = true})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1) -- jump to immediate context
end, { silent = true })

vim.keymap.set("n", "<leader>cx", ":call VrcQuery()<CR>", { noremap = true })
