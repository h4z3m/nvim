return {
    -- fugitive
    'tpope/vim-fugitive',
    event = 'BufWinEnter',
    keys = {
        { "<leader>gs", "<cmd>G<cr>", desc = "Git Status" }
    }
}
