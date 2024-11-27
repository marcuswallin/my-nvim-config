function FormatWithPrettier()
    local file = vim.fn.expand('%:p') -- Get the current file's path
    local cmd = string.format("prettier --write %s", file)

    vim.fn.system(cmd)
    vim.cmd("edit") 
end

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lspconfig').pyright.setup({

                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = bufnr,
                        callback = function()
                            vim.cmd("Black")
                        end,
                    })
                end,
            })

            require('lspconfig').jsonls.setup({})
            require('lspconfig').ts_ls.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
 --                   vim.keymap.set({ 'n', 'x' }, '<F9>', '<cmd>lua FormatWithPrettier()<cr>')
                    vim.api.nvim_create_autocmd('BufWritePost', {
                        buffer = bufnr,
                        callback = FormatWithPrettier
                    })
                end,
            })
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    }
}
