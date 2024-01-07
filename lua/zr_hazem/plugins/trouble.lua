return {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup {
            icons = true
        }
        vim.diagnostic.config({
            virtual_text = false
        })
        vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", {
            silent = true,
            noremap = true
        })
        vim.keymap.set("n", "[d", function()
            require("trouble").next({
                skip_groups = true,
                jump = true
            })

        end)
        vim.keymap.set("n", "]d", function()
            require("trouble").previous({
                skip_groups = true,
                jump = true
            })
        end)

    end
}
