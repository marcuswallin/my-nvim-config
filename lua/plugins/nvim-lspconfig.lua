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
            require('lspconfig').lua_ls.setup({})
        end,
    }
}
