return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "vendor" }
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })
    end,
    keys = { {
        "<leader>ps",
        function()
            local builtin = require('telescope.builtin')
            builtin.grep_string({
                search = vim.fn.input("Grep > ")
            })
        end,
        desc = "Grep Plugin File"
    }, {
        "<leader>pg",
        "<cmd>lua require('telescope.builtin').git_files()<cr>",
        desc = "Find Git File"

    }, { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>" } }

}
