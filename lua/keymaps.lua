vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-w>', "<C-\\><C-n><C-w>")

vim.keymap.set('n', '<leader>ts', ':vsplit | terminal<CR>')
vim.keymap.set('n', '<leader>tt', ':terminal<CR>')
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')

vim.keymap.set('n', '<leader>ob', ':PyrightOrganizeImports<CR>:Black<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>dh', '<cmd>lua vim.diagnostic.open_float()<CR>',
            { noremap = true, silent = true })
    end,
})
