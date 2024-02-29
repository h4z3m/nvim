return { {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets", 'saadparwaiz1/cmp_luasnip' },
    build = "make install_jsregexp",
    config = function()
        require("luasnip").setup()
        require("luasnip.loaders.from_vscode").lazy_load()
        local ls = require("luasnip")
        vim.keymap.set({ "i" }, "<C-K>", function()
            ls.expand()
        end, {
            silent = true
        })
        vim.keymap.set({ "i", "s" }, "<C-L>", function()
            ls.jump(1)
        end, {
            silent = true
        })
        vim.keymap.set({ "i", "s" }, "<C-J>", function()
            ls.jump(-1)
        end, {
            silent = true
        })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {
            silent = true
        })
    end
}, {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        local neogen = require('neogen').setup({
            snippet_engine = "luasnip"
        })

        vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", {
            noremap = true
        })
        vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", {
            noremap = true
        })
    end,
    version = "*"
} }
