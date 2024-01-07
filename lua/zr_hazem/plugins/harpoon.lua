return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim"},
    config = true,
    keys = {{
        "<leader>a",
        "<cmd>lua require('harpoon.mark').add_file() print('Added file to harpoon')<cr>",
        desc = "Mark file with harpoon"
    }, {
        "<C-n>",
        "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        desc = "Go to next harpoon mark"
    }, {
        "<C-p>",
        "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
        desc = "Go to previous harpoon mark"
    }, {
        "<C-e>",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        desc = "Show harpoon marks"
    }}
}
