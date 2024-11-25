return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        -- {'<leader>ff', require("telescope.builtin").find_files},
        --{'<leader>gf', require("telescope.builtin").git_files},
        {'<leader>grep', function() 
            require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")});
        end},
    }
}
