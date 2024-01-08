return {
    -- undotree
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
    end,
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" } }
}
