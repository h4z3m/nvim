return {{
    'j-hui/fidget.nvim',
    config = true
}, {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig", 'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp',
                    'j-hui/fidget.nvim'},
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
            ensure_installed = {"pyright", "tsserver", "gopls", "clangd", "lua_ls", "cmake", "cssls", "html", "jsonls",
                                "yamlls", "dockerls", "docker_compose_language_service", "sqlls"},
            handlers = {function(server_name)
                require('lspconfig')[server_name].setup {}
            end}
        })
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-h>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-l'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({
                    select = true
                }),
                ["<C-Space>"] = cmp.mapping.complete()

            }),
            sources = cmp.config.sources({{
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            } -- For luasnip users.
            }, {{
                name = 'buffer'
            }})
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
    keys = {{
        "<leader>l",
        function()
            require("lsp_lines").toggle()
        end,
        desc = "Toggle lsp_lines"
    }}
}}
