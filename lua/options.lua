vim.g.mapleader = " "
vim.o.scrolloff = 8

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 1000
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 }) -- Adjust timeout as needed
    end,
})
