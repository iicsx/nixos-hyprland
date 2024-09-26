require("pck")
require("set")
require("remap")

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

vim.cmd([[autocmd VimEnter * lua require('packer').sync()]])
vim.cmd([[autocmd VimEnter * TSUpdate]])
vim.cmd([[autocmd VimEnter * MasonUpdate]])

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
