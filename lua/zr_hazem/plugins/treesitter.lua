local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({
            with_sync = true
        })()
    end,
    lazy = false,
    config = function()
        require 'nvim-treesitter.install'.compilers = { "clang" }
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "cpp", "bash", "html", "php", "go", "python", "lua", "json", "yaml", "toml",
                "markdown", "markdown_inline", "vim", "vimdoc", "query", "regex", "java", "javascript",
                "typescript", "tsx", "cmake", "make", "css", "dockerfile", "gitignore", "gitcommit",
                "gomod", "http", "jsonc", "vue", "xml" },
            sync_install = false,
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}

return { M }
