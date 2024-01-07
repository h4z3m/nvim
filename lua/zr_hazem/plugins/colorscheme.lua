return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = true,
        name = "tokyonight"
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
    },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        priority = 1000,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end
    }
}
