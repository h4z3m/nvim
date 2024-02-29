return { {
    'j-hui/fidget.nvim',
    config = true
}, {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig", 'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp',
        'j-hui/fidget.nvim' },
    lazy = false,
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = { "tsserver", "gopls", "clangd", "lua_ls", "cmake", "cssls", "html", "jsonls",
                "yamlls", "dockerls", "docker_compose_language_service", "sqlls" },
            handlers = { function(server_name)
                require('lspconfig')[server_name].setup {}
            end }
        })
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-m>'] = cmp.mapping.confirm({
                    select = true
                }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),

                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-l>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- that way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources({ {
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            } -- For luasnip users.
            }, { {
                name = 'buffer'
            } })
        })
    end
}, {
    "Maan2003/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({
            virtual_text = false
        })
    end,
    keys = { {
        "<leader>l",
        function()
            require("lsp_lines").toggle()
        end,
        desc = "Toggle lsp_lines"
    } }
} }
