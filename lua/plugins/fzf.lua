return {
    {
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' },
        keys = {
            { '<leader>bb',  ':Buffers<CR>' },
            { '<leader>f',  ':Files<CR>' },
            { '<leader>gf', ':GFiles<CR>' },
            { '<leader>rg', ':RG<CR>' }
        }
    }
}
