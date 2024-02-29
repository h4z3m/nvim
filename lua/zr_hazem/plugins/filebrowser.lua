return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            extensions = {

                file_browser = {

                    hijack_netrw = true
                }
            }
        })
        require("telescope").load_extension("file_browser")
        vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", { desc = "File Browser" })
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find File" })
    end
}
